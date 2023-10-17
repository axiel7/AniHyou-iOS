//
//  HomeViewModel.swift
//  AniHyou
//
//  Created by Axel Lopez on 17/10/2023.
//

import Foundation
import AniListAPI

class HomeViewModel: ObservableObject {
    
    @Published var notificationCount = 0

    func getNotificationCount() {
        Network.shared.apollo.fetch(query: NotificationCountQuery()) { [weak self] result in
            switch result {
            case .success(let graphQLResult):
                self?.notificationCount = graphQLResult.data?.viewer?.unreadNotificationCount ?? 0
            case .failure(let error):
                print(error)
            }
        }
    }
}
