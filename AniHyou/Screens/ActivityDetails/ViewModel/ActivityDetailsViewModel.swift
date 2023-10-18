//
//  ActivityDetailsViewModel.swift
//  AniHyou
//
//  Created by Axel Lopez on 18/10/2023.
//

import Foundation
import AniListAPI

class ActivityDetailsViewModel: ObservableObject {
    
    var hasNextPage = true
    
    @Published var replies = [ActivityReplyFragment]()
    
    func getReplies(activityId: Int) {
        Network.shared.apollo.fetch(query: ActivityRepliesQuery(activityId: .some(activityId))) { [weak self] result in
            switch result {
            case .success(let graphQLResult):
                if let activity = graphQLResult.data?.activity {
                    if let replies = activity.asListActivity?.replies {
                        self?.replies.append(contentsOf: replies.compactMap { $0?.fragments.activityReplyFragment })
                    } else if let replies = activity.asTextActivity?.replies {
                        self?.replies.append(contentsOf: replies.compactMap { $0?.fragments.activityReplyFragment })
                    } else if let replies = activity.asMessageActivity?.replies {
                        self?.replies.append(contentsOf: replies.compactMap { $0?.fragments.activityReplyFragment })
                    }
                    self?.hasNextPage = false
                }
            case .failure(let error):
                print(error)
            }
        }
    }
}
