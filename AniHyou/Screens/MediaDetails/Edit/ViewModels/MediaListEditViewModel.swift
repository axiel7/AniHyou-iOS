//
//  MediaListEditViewModel.swift
//  AniHyou
//
//  Created by Axel Lopez on 20/6/22.
//

import Foundation
import API

class MediaListEditViewModel: ObservableObject {
    
    @Published var isLoading = false
    
    @Published var score: Double = 0 {
        didSet {
            if score > scoreMax {
                score = oldValue
            }
        }
    }
    
    var scoreFormat: ScoreFormat {
        if let formatRaw = UserDefaults.standard.string(forKey: USER_SCORE_KEY) {
            return ScoreFormat(rawValue: formatRaw) ?? .point10
        }
        else { return .point10 }
    }
    
    var scoreMax: Double {
        switch scoreFormat {
        case .point100:
            return 100
        case .point10, .point10Decimal:
            return 10
        case .point5:
            return 5
        case .point3:
            return 3
        }
    }
    
    var scoreHint: String {
        return String(format: "%.0f", scoreMax)
    }
    
    var scoreRange: ClosedRange<Double> {
        return 0...scoreMax
    }
    
    var scoreStep: Double {
        switch scoreFormat {
        case .point100, .point10, .point5, .point3:
            return 1
        case .point10Decimal:
            return 0.5
        }
    }
    
    @Published var isUpdateSuccess = false
    
    func updateEntry(mediaId: Int, status: MediaListStatus?, score: Double?, progress: Int?, progressVolumes: Int?, startedAt: Date?, completedAt: Date?, repeatCount: Int?) {
        isLoading = true
        let statusQL: GraphQLNullable<GraphQLEnum<MediaListStatus>> = status != nil ? .some(.case(status!)) : .none
        let scoreQL: GraphQLNullable<Double> = score != nil ? .some(score!) : .none
        let progressQL: GraphQLNullable<Int> = progress != nil ? .some(progress!) : .none
        let progressVolumesQL: GraphQLNullable<Int> = progressVolumes != nil ? .some(progressVolumes!) : .none
        let startedAtQL: GraphQLNullable<FuzzyDateInput> = startedAt != nil ? .some(startedAt!.toFuzzyDate()) : .none
        let completedAtQL: GraphQLNullable<FuzzyDateInput> = completedAt != nil ? .some(completedAt!.toFuzzyDate()) : .none
        let repeatQL: GraphQLNullable<Int> = repeatCount != nil ? .some(repeatCount!) : .none
        
        Network.shared.apollo.perform(mutation: UpdateEntryMutation(mediaId: .some(mediaId), status: statusQL, score: scoreQL, progress: progressQL, progressVolumes: progressVolumesQL, startedAt: startedAtQL, completedAt: completedAtQL, repeat: repeatQL)) { [weak self] result in
            switch result {
            case .success(let graphQLResult):
                if let data = graphQLResult.data?.saveMediaListEntry {
                    if let errors = graphQLResult.errors {
                        for error in errors {
                            print(error)
                        }
                    } else {
                        print(data)
                        self?.isUpdateSuccess = true
                    }
                }
            case .failure(let error):
                print(error)
            }
            self?.isLoading = false
        }
    }
    
    func deleteEntry(entryId: Int) {
        isLoading = true
        Network.shared.apollo.perform(mutation: DeleteMediaListMutation(mediaListEntryId: .some(entryId))) { [weak self] result in
            switch result {
            case .success(let graphQLResult):
                if let deleted = graphQLResult.data?.deleteMediaListEntry?.deleted {
                    self?.isUpdateSuccess = deleted
                }
            case .failure(let error):
                print(error)
            }
            self?.isLoading = false
        }
    }
}
