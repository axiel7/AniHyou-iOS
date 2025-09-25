//
//  HomeViewModel.swift
//  AniHyou
//
//  Created by Axel Lopez on 08/09/2024.
//

import Foundation
import SwiftUI

@Observable class HomeViewModel {
    
    var unreadNotificationsCount = 0
    
    func getUnreadNotificationsCount() async {
        unreadNotificationsCount = await UserRepository.getUnreadNotificationsCount() ?? 0
    }
}
