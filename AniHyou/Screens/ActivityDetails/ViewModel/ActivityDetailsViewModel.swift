//
//  ActivityDetailsViewModel.swift
//  AniHyou
//
//  Created by Axel Lopez on 18/10/2023.
//

import Foundation
import AniListAPI

class ActivityDetailsViewModel: ObservableObject {
    
    @Published var isLoading = true
    
    @Published var listActivity: ListActivityFragment?
    @Published var textActivity: TextActivityFragment?
    @Published var messageActivity: MessageActivityFragment?
    
    @Published var replies = [ActivityReplyFragment]()
    
    func getDetails(activityId: Int) {
        Network.shared.apollo.fetch(query: ActivityDetailsQuery(activityId: .some(activityId))) { [weak self] result in
            switch result {
            case .success(let graphQLResult):
                if let activity = graphQLResult.data?.activity {
                    if let details = activity.asListActivity {
                        self?.listActivity = details.fragments.listActivityFragment
                        if let replies = details.replies {
                            self?.replies.append(contentsOf: replies.compactMap { $0?.fragments.activityReplyFragment })
                        }
                    } else if let details = activity.asTextActivity {
                        self?.textActivity = details.fragments.textActivityFragment
                        if let replies = details.replies {
                            self?.replies.append(contentsOf: replies.compactMap { $0?.fragments.activityReplyFragment })
                        }
                    } else if let details = activity.asMessageActivity {
                        self?.messageActivity = details.fragments.messageActivityFragment
                        if let replies = details.replies {
                            self?.replies.append(contentsOf: replies.compactMap { $0?.fragments.activityReplyFragment })
                        }
                    }
                    self?.isLoading = false
                }
            case .failure(let error):
                print(error)
            }
        }
    }
}
