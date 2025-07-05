//
//  DonationsView.swift
//  AniHyou
//
//  Created by Axel Lopez on 18/07/2023.
//

import SwiftUI
import StoreKit

struct DonationsView: View {

    @StateObject private var viewModel = DonationsViewModel()

    var body: some View {
        ScrollView(.vertical) {
            VStack(spacing: 16) {
                Image("AniHyou-Default")
                    .resizable()
                    .clipShape(RoundedRectangle(cornerRadius: 20.0, style: .continuous))
                    .frame(width: 100, height: 100)

                Text("Support the development of AniHyou!")
                    .font(.title2)
                    .bold()
                    .multilineTextAlignment(.center)

                Text("""
                    As you may known this app is completely free and Open Source,
                    but creating an app requires a lot of time and effort.
                    By making a donation you will help cover the costs of
                    development, maintenance, and new features.
                    """
                )

                ForEach(viewModel.products) { product in
                    HStack {
                        Text(product.emoji)
                        Text(product.displayName)
                        Spacer()
                        Button(product.displayPrice) {
                            Task {
                                try await viewModel.purchase(product)
                            }
                        }
                    }
                }
                .buttonStyleGlassProminentCompat()
                .buttonBorderShape(.capsule)

                Text("With any purchase you will gain access to exclusive app icons and custom accent colors!")
                Text("Thank you :)")
                
                Button("Restore purchases") {
                    Task {
                       try? await AppStore.sync()
                    }
                }
            }//:VStack
            .padding()
            .navigationTitle("Donation")
            .navigationBarTitleDisplayMode(.inline)
        }//:VScrollView
    }
}

#Preview {
    DonationsView()
}
