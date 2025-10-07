//
//  HomeViewModel.swift
//  AniHyou
//
//  Created by Axel Lopez on 08/09/2024.
//

import Foundation
import SwiftUI

@MainActor
@Observable class HomeViewModel {
    
    var unreadNotificationsCount = 0
    
    func getUnreadNotificationsCount() async {
        unreadNotificationsCount = await UserRepository.getUnreadNotificationsCount() ?? 0
    }
}
