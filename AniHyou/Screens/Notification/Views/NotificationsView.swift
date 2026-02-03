//
//  NotificationsView.swift
//  AniHyou
//
//  Created by Axel Lopez on 23/7/22.
//

import SwiftUI

struct NotificationsView: View {

    @Environment(\.dismiss) private var dismiss
    @State private var viewModel = NotificationsViewModel()
    @AppStorage(LOGGED_IN_KEY) private var isLoggedIn: Bool = false
    var unreadCount: Int?

    var body: some View {
        NavigationStack {
            Group {
                if isLoggedIn {
                    List {
                        Picker("Filter", selection: $viewModel.type) {
                            ForEach(NotificationTypeGrouped.allCases, id: \.self) { type in
                                Text(type.localizedName)
                            }
                        }
                        .pickerStyle(.menu)

                        ForEach(viewModel.notifications.indices, id: \.self) { index in
                            NotificationItemView(
                                notification: viewModel.notifications[index],
                                isUnread: index < viewModel.unreadCount
                            )
                        }

                        if viewModel.hasNextPage {
                            HorizontalProgressView()
                                .task {
                                    await viewModel.getNotifications()
                                }
                        }
                    }
                    .onChange(of: viewModel.type) {
                        viewModel.resetPage()
                    }
                    .task {
                        if let unreadCount {
                            viewModel.unreadCount = unreadCount
                        } else {
                            await viewModel.getUnreadNotificationsCount()
                        }
                        await viewModel.getNotifications()
                    }
                } else {
                    NotLoggedView()
                }
            }
            .navigationTitle("Notifications")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                if #available(iOS 26, *) {
                    ToolbarItem(placement: .cancellationAction) {
                        Button(action: { dismiss() }) {
                            Label("Close", systemImage: "xmark")
                        }
                        .tint(nil)
                    }
                } else {
                    ToolbarItem {
                        Button("Done") {
                            dismiss()
                        }
                        .font(.bold(.body)())
                    }
                }
            }
        }//:NavigationStack
    }
}

#Preview {
    NotificationsView()
}
