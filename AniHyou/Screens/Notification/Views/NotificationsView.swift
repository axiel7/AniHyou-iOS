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
    @AppStorage(LOGGED_IN_KEY) private var isLoggedIn: Bool = false

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

                        ForEach(viewModel.notifications) { notification in
                            NotificationItemView(notification: notification)
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
                } else {
                    NotLoggedView()
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
        }//:NavigationStack
    }
}

#Preview {
    NotificationsView()
}
