//
//  ActivityDetailsViewModel.swift
//  AniHyou
//
//  Created by Axel Lopez on 18/10/2023.
//

import Foundation
import AniListAPI

@MainActor
@Observable class ActivityDetailsViewModel {
    
    var isLoading = true
    
    var listActivity: ListActivityFragment?
    var textActivity: TextActivityFragment?
    var messageActivity: MessageActivityFragment?
    
    var replies = [ActivityReplyFragment]()
    
    func getDetails(activityId: Int) async {
        isLoading = true
        if let result = await ActivityRepository.getActivityDetails(activityId: Int32(activityId)) {
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
