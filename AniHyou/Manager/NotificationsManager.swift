//
//  NotificationsManager.swift
//  AniHyou
//
//  Created by Axel Lopez on 30/03/2024.
//

import Foundation
import BackgroundTasks
import UserNotifications

final class NotificationsManager {
    
    @discardableResult
    static func fetchAndSendNotifications() async -> [GenericNotification]? {
        let notifications = await UserRepository.fetchNewNotifications()
        if let notifications {
            for info in notifications {
                let content = UNMutableNotificationContent()
                content.body = info.text
                
                await NotificationsManager.addNotification(id: info.id.stringValue, content: content)
            }
        }
        #if DEBUG
        if notifications?.isEmpty == true {
            let content = UNMutableNotificationContent()
            content.body = "No new notifications"
            
            await NotificationsManager.addNotification(id: "empty", content: content)
        }
        #endif
        return notifications
    }
    
    static func scheduleFetch(repeatHours: Int) {
        let request = BGAppRefreshTaskRequest(identifier: FETCH_NOTIFICATIONS_BACKGROUND_TASK_IDENTIFIER)
        // Fetch no earlier than X hours from now.
        let interval = TimeInterval(repeatHours * 3600)
        request.earliestBeginDate = Date(timeIntervalSinceNow: interval)
        
        do {
            try BGTaskScheduler.shared.submit(request)
            
        } catch {
            print("Could not schedule app refresh: \(error)")
        }
    }
    
    static func cancelSchedule() {
        BGTaskScheduler.shared.cancel(taskRequestWithIdentifier: FETCH_NOTIFICATIONS_BACKGROUND_TASK_IDENTIFIER)
    }
    
    static func addNotification(
        id: String,
        content: UNMutableNotificationContent,
        timeInterval: TimeInterval = 5
    ) async {
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: timeInterval, repeats: false)
        let request = UNNotificationRequest(
            identifier: id,
            content: content,
            trigger: trigger
        )
        try? await UNUserNotificationCenter.current().add(request)
    }
}
