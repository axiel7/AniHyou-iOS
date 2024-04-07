//
//  NotificationsViewModel.swift
//  AniHyou
//
//  Created by Axel Lopez on 23/7/22.
//

import Foundation
import AniListAPI
import UserNotifications

class NotificationsViewModel: ObservableObject {

    @Published var notifications = [GenericNotification]()
    @Published var type: NotificationTypeGrouped = .all
    var currentPage = 1
    var hasNextPage = true

    func getNotifications() async {
        if let result = await UserRepository.getNotifications(
            page: currentPage,
            type: type,
            resetCount: currentPage == 1
        ) {
            DispatchQueue.main.async {
                self.notifications.append(contentsOf: result.data)
                self.currentPage = result.page
                self.hasNextPage = result.hasNextPage
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
