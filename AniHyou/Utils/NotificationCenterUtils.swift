//
//  NotificationCenterUtils.swift
//  AniHyou
//
//  Created by Axel Lopez on 28/03/2024.
//

import Foundation

extension NotificationCenter {
    func post(name: String, object: Any?) {
        self.post(name: Notification.Name(name), object: object)
    }
    
    func publisher(for name: String) -> NotificationCenter.Publisher {
        self.publisher(for: Notification.Name(name))
    }
}
