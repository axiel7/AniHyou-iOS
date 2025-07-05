//
//  NotLoggedView.swift
//  AniHyou
//
//  Created by Axel Lopez on 10/6/22.
//

import SwiftUI

struct NotLoggedView: View {
    @StateObject private var viewModel = LoginViewModel()

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
            .buttonStyleGlassProminentCompat()
        }
    }
}

#Preview {
    NotLoggedView()
}
