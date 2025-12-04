//
//  UpdateMediaEntryView.swift
//  AniHyouShou Watch App
//
//  Created by Axel Lopez on 12/01/2023.
//

import SwiftUI
import AniListAPI

struct UpdateMediaEntryView: View {
    @Environment(\.dismiss) var dismiss

    let entry: ShouUserMediaList?
    var viewModel: MediaListViewModel

    var body: some View {
        VStack(alignment: .leading) {
            Text(entry?.media?.title?.userPreferred ?? "")
                .font(.title3)
            Spacer()

            if let maxProgress = entry?.maxProgress {
                Text("\(entry?.progressPreferred ?? 0)/\(maxProgress)")
            } else {
                Text("\(entry?.progressPreferred ?? 0)")
            }

            Button(
                action: {
                    Task {
                        await viewModel.updateEntryProgress(of: entry!)
                    }
                },
                label: {
                    if viewModel.isLoading {
                        ProgressView()
                        .frame(height: 13)
                    } else {
                        if entry?.media?.type?.value == .anime {
                            Label("Ep", systemImage: "plus")
                        } else {
                            Label(entry?.isVolumeProgress == true ? "Vol" : "Ch",
                                  systemImage: "plus"
                            )
                        }
                    }
                }
            )
            .tint(Color(hex: entry?.media?.coverImage?.color))
        }
        .onChange(of: viewModel.shouldDismiss) {
            if viewModel.shouldDismiss {
                dismiss()
            }
        }
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    UpdateMediaEntryView(entry: nil, viewModel: MediaListViewModel())
}
