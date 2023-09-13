//
//  NotLoggedView.swift
//  AniHyou
//
//  Created by Axel Lopez on 10/6/22.
//

import SwiftUI
import WidgetKit

struct NotLoggedView: View {
    @StateObject private var viewModel = LoginViewModel()
    var onSuccessLogin: () -> Void

    var body: some View {
        VStack {
            Text("Please login to use this feature")
            Button(
                action: {
                    viewModel.login()
                },
                label: {
                    Text("Login")
                }
            )
            .buttonStyle(.borderedProminent)
        }
        .onReceive(viewModel.$isLoginSuccess) { isSuccess in
            if isSuccess {
                WidgetCenter.shared.reloadAllTimelines()
                onSuccessLogin()
            }
        }
    }
}

#Preview {
    NotLoggedView(onSuccessLogin: {})
}
