//
//  NotificationsViewModel.swift
//  AniHyou
//
//  Created by Axel Lopez on 23/7/22.
//

import Foundation
import AniListAPI

class NotificationsViewModel: ObservableObject {

    @Published var notifications = [GenericNotification]()
    @Published var type: NotificationTypeGrouped = .all
    var currentPage = 1
    var hasNextPage = true

    func getNotifications() {
        var typeIn: GraphQLNullable<[GraphQLEnum<NotificationType>?]> = .some(type.value.compactMap { GraphQLEnum($0) })
        if type == .all {
            typeIn = .none
        }
        Network.shared.apollo.fetch(query: NotificationsQuery(
            page: .some(currentPage),
            perPage: .some(20),
            typeIn: typeIn
        )) { [weak self] result in
            switch result {
            case .success(let graphQLResult):
                if let page = graphQLResult.data?.page {
                    if let notifications = page.notifications {
                        var tempList = [GenericNotification]()
                        notifications.forEach {
                            if let noti = $0?.toGenericNotification() {
                                tempList.append(noti)
                            }
                        }
                        tempList.sort(by: { first, second in first.createdAt > second.createdAt })

                        self?.notifications.append(contentsOf: tempList)
                    }
                    if self?.currentPage == 1 {
                        NotificationCenter.default.post(name: "readNotifications", object: nil)
                    }
                    self?.currentPage += 1
                    self?.hasNextPage = page.pageInfo?.hasNextPage ?? false
                }
            case .failure(let error):
                print(error)
            }
        }
    }

    func resetPage() {
        notifications.removeAll()
        currentPage = 1
        hasNextPage = true
    }
}
