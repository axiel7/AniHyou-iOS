//
//  NotificationsViewModel.swift
//  AniHyou
//
//  Created by Axel Lopez on 23/7/22.
//

import Foundation
import AniListAPI
import UserNotifications

@Observable class NotificationsViewModel {

    var notifications = [GenericNotification]()
    var type: NotificationTypeGrouped = .all
    var currentPage = 1
    var hasNextPage = true

    func getNotifications() async {
        let resetCount = currentPage == 1
        if let result = await UserRepository.getNotifications(
            page: currentPage,
            type: type,
            resetCount: resetCount
        ) {
            notifications.append(contentsOf: result.data)
            currentPage = result.page
            hasNextPage = result.hasNextPage
            if resetCount {
                UNUserNotificationCenter.current().removeAllDeliveredNotifications()
            }
        }
    }

    func resetPage() {
        notifications.removeAll()
        currentPage = 1
        hasNextPage = true
    }
}
