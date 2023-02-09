//
//  NotificationsView.swift
//  AniHyou
//
//  Created by Axel Lopez on 23/7/22.
//

import SwiftUI

struct NotificationsView: View {
    
    @Environment(\.dismiss) private var dismiss
    @StateObject private var viewModel = NotificationsViewModel()
    
    var body: some View {
        NavigationView {
            Group {
                if isLoggedIn() {
                    List {
                        ForEach(viewModel.notifications) {
                            if let notification = $0 {
                                NotificationItemView(notification: notification)
                            }
                        }
                        
                        if viewModel.hasNextPage {
                            ProgressView()
                                .onAppear {
                                    viewModel.getNotifications()
                                }
                        }
                    }
                } else {
                    NotLoggedView(onSuccessLogin: { dismiss() })
                }
            }
            .navigationTitle("Notifications")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem {
                    Button("Done") {
                        dismiss()
                    }
                    .font(.bold(.body)())
                }
            }
        }
    }
}

struct NotificationsView_Previews: PreviewProvider {
    static var previews: some View {
        NotificationsView()
    }
}
