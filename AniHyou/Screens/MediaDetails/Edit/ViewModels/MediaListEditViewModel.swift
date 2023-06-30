//
//  MediaListEditViewModel.swift
//  AniHyou
//
//  Created by Axel Lopez on 20/6/22.
//

import Foundation
import AniListAPI

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
    var updatedEntry: BasicMediaListEntry? = nil
    
    func updateEntry(mediaId: Int, status: MediaListStatus?, score: Double?, progress: Int?, progressVolumes: Int?, startedAt: Date?, completedAt: Date?, repeatCount: Int?) {
        isLoading = true
        
        Network.shared.apollo.perform(mutation: UpdateEntryMutation(mediaId: .some(mediaId), status: someIfNotNil(status), score: someIfNotNil(score), progress: someIfNotNil(progress), progressVolumes: someIfNotNil(progressVolumes), startedAt: someIfNotNil(startedAt?.toFuzzyDate()), completedAt: someIfNotNil(completedAt?.toFuzzyDate()), repeat: someIfNotNil(repeatCount))) { [weak self] result in
            switch result {
            case .success(let graphQLResult):
                if let data = graphQLResult.data?.saveMediaListEntry {
                    if let errors = graphQLResult.errors {
                        for error in errors {
                            print(error)
                        }
                    } else {
                        self?.updatedEntry = data.fragments.basicMediaListEntry
                        self?.isUpdateSuccess = true
                    }
                }
            case .failure(let error):
                print(error)
            }
            self?.isLoading = false
        }
    }
    
    @Published var isDeleteSuccess = false
    
    func deleteEntry(entryId: Int) {
        isLoading = true
        Network.shared.apollo.perform(mutation: DeleteMediaListMutation(mediaListEntryId: .some(entryId))) { [weak self] result in
            switch result {
            case .success(let graphQLResult):
                if let deleted = graphQLResult.data?.deleteMediaListEntry?.deleted {
                    self?.isDeleteSuccess = deleted
                }
            case .failure(let error):
                print(error)
            }
            self?.isLoading = false
        }
    }
}
