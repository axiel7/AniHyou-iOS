//
//  UpdateMediaEntryView.swift
//  AniHyouShou Watch App
//
//  Created by Axel Lopez on 12/01/2023.
//

import SwiftUI
import AniListAPI

struct UpdateMediaEntryView: View {

    let entry: CommonUserMediaList
    @ObservedObject var viewModel: MediaListViewModel

    var body: some View {
        VStack(alignment: .leading) {
            Text(entry.media?.title?.userPreferred ?? "")
                .font(.title3)
            Spacer()

            Text("\(entry.progress ?? 0)/\(entry.maxProgress)")

            Button(
                action: {
                    Task {
                        await viewModel.updateEntryProgress(of: entry)
                    }
                },
                label: {
                    if viewModel.isLoading {
                        ProgressView()
                        .frame(height: 13)
                    } else {
                        Text("+1")
                    }
                }
            )
            .tint(Color(hex: entry.media?.coverImage?.color))
        }
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    UpdateMediaEntryView(entry: .init(_fieldData: nil), viewModel: MediaListViewModel())
}
