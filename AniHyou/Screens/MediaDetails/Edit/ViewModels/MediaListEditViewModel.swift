//
//  MediaListEditViewModel.swift
//  AniHyou
//
//  Created by Axel Lopez on 20/6/22.
//

import Foundation
import API

class MediaListEditViewModel: ObservableObject {
    
    @Published var isUpdateSuccess = false
    
    func updateEntry(mediaId: Int, status: MediaListStatus?, score: Double?, progress: Int?, progressVolumes: Int?, startedAt: Date?, completedAt: Date?) {
        let statusQL: GraphQLNullable<GraphQLEnum<MediaListStatus>> = status != nil ? .some(.case(status!)) : .none
        let scoreQL: GraphQLNullable<Double> = score != nil ? .some(score!) : .none
        let progressQL: GraphQLNullable<Int> = progress != nil ? .some(progress!) : .none
        let progressVolumesQL: GraphQLNullable<Int> = progressVolumes != nil ? .some(progressVolumes!) : .none
        let startedAtQL: GraphQLNullable<FuzzyDateInput> = startedAt != nil ? .some(startedAt!.toFuzzyDate()) : .none
        let completedAtQL: GraphQLNullable<FuzzyDateInput> = completedAt != nil ? .some(completedAt!.toFuzzyDate()) : .none
        
        Network.shared.apollo.perform(mutation: UpdateEntryMutation(mediaId: .some(mediaId), status: statusQL, score: scoreQL, progress: progressQL, progressVolumes: progressVolumesQL, startedAt: startedAtQL, completedAt: completedAtQL)) { [weak self] result in
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
        }
    }
    
    @Published var score: Double = 0 {
        didSet {
            if score > 10 {
                score = oldValue
            }
        }
    }
}
