//
//  MediaListEditViewModel.swift
//  AniHyou
//
//  Created by Axel Lopez on 20/6/22.
//

import Foundation

class MediaListEditViewModel: ObservableObject {
    
    @Published var isUpdateSuccess = false
    
    func updateEntry(mediaId: Int, status: MediaListStatus?, score: Double?, progress: Int?, progressVolumes: Int?, startedAt: Date?, completedAt: Date?) {
        Network.shared.apollo.perform(mutation: UpdateEntryMutation(mediaId: mediaId, status: status, score: score, progress: progress, progressVolumes: progressVolumes, startedAt: startedAt?.toFuzzyDate(), completedAt: completedAt?.toFuzzyDate())) { result in
            switch result {
            case .success(let graphQLResult):
                if let data = graphQLResult.data?.saveMediaListEntry {
                    if let errors = graphQLResult.errors {
                        for error in errors {
                            print(error)
                        }
                    } else {
                        print(data)
                        self.isUpdateSuccess = true
                    }
                }
            case .failure(let error):
                print(error)
            }
        }
    }
    
}
