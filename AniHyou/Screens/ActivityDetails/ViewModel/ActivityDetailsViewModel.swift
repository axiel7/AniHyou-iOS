//
//  ActivityDetailsViewModel.swift
//  AniHyou
//
//  Created by Axel Lopez on 18/10/2023.
//

import Foundation
import AniListAPI

@MainActor
class ActivityDetailsViewModel: ObservableObject {
    
    @Published var isLoading = true
    
    @Published var listActivity: ListActivityFragment?
    @Published var textActivity: TextActivityFragment?
    @Published var messageActivity: MessageActivityFragment?
    
    @Published var replies = [ActivityReplyFragment]()
    
    func getDetails(activityId: Int) async {
        isLoading = true
        if let result = await ActivityRepository.getActivityDetails(activityId: activityId) {
            if let details = result.asListActivity {
                listActivity = details.fragments.listActivityFragment
                if let replies = details.replies?.compactMap({ $0?.fragments.activityReplyFragment }) {
                    self.replies.append(contentsOf: replies)
                }
            } else if let details = result.asTextActivity {
                textActivity = details.fragments.textActivityFragment
                if let replies = details.replies?.compactMap({ $0?.fragments.activityReplyFragment }) {
                    self.replies.append(contentsOf: replies)
                }
            } else if let details = result.asMessageActivity {
                messageActivity = details.fragments.messageActivityFragment
                if let replies = details.replies?.compactMap({ $0?.fragments.activityReplyFragment }) {
                    self.replies.append(contentsOf: replies)
                }
            }
        }
        isLoading = false
    }
}
