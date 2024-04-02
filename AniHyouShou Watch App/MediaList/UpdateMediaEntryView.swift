//
//  UpdateMediaEntryView.swift
//  AniHyouShou Watch App
//
//  Created by Axel Lopez on 12/01/2023.
//

import SwiftUI
import AniListAPI

struct UpdateMediaEntryView: View {

    let entry: UserMediaListQuery.Data.Page.MediaList?
    @ObservedObject var viewModel: MediaListViewModel

    var body: some View {
        Group {
            if let entry {
                VStack(alignment: .leading) {
                    Text(entry.media?.title?.userPreferred ?? "")
                        .font(.title3)
                    Spacer()

                    Text("\(entry.progress ?? 0)/\(entry.totalProgress ?? 0)")

                    Button(
                        action: {
                            viewModel.updateEntryProgress(of: entry.fragments.basicMediaListEntry)
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
            } else {
                Text("Error no entry")
            }
        }
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    UpdateMediaEntryView(entry: nil, viewModel: MediaListViewModel())
}
