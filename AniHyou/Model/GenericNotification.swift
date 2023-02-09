//
//  GenericNotification.swift
//  AniHyou
//
//  Created by Axel Lopez on 09/02/2023.
//

import Foundation
import API

struct GenericNotification: Identifiable {
    let id: Int
    let text: String
    let imageUrl: String?
    let contentId: Int?
    let type: NotificationType
    let createdAt: Int
}
