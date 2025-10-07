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
    
    @MainActor
    static func handleFetchTask(_ task: BGAppRefreshTask) {
        NotificationsManager.scheduleFetch()
        
        let operation = Task {
            let notifications = await UserRepository.fetchNewNotifications()
            if let notifications {
                for info in notifications {
                    let content = UNMutableNotificationContent()
                    content.body = info.text
                    
                    let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
                    let request = UNNotificationRequest(
                        identifier: info.id.stringValue,
                        content: content,
                        trigger: trigger
                    )
                    try? await UNUserNotificationCenter.current().add(request)
                }
            }
            task.setTaskCompleted(success: notifications != nil)
        }
        
        task.expirationHandler = {
            operation.cancel()
        }
    }
    
    static func scheduleFetch() {
        let request = BGAppRefreshTaskRequest(identifier: FETCH_NOTIFICATIONS_BACKGROUND_TASK_IDENTIFIER)
        // Fetch no earlier than 6 hours from now.
        request.earliestBeginDate = Date(timeIntervalSinceNow: 6 * 3600)
        
        do {
            try BGTaskScheduler.shared.submit(request)
        } catch {
            print("Could not schedule app refresh: \(error)")
        }
    }
    
    static func cancelSchedule() {
        BGTaskScheduler.shared.cancel(taskRequestWithIdentifier: FETCH_NOTIFICATIONS_BACKGROUND_TASK_IDENTIFIER)
    }
}
