//
//  UpdateMediaEntryView.swift
//  AniHyouShou Watch App
//
//  Created by Axel Lopez on 12/01/2023.
//

import SwiftUI
import AniListAPI

struct UpdateMediaEntryView: View {
    
    var entry: UserMediaListQuery.Data.Page.MediaList?
    @ObservedObject var viewModel: MediaListViewModel
    
    var body: some View {
        Group {
            if entry != nil {
                VStack(alignment: .leading) {
                    Text(entry!.media?.title?.userPreferred ?? "")
                        .font(.title3)
                    Spacer()
                    
                    Text("\(entry!.progress ?? 0)/\(entry!.totalProgress ?? 0)")

                    Button(action: {
                        viewModel.updateEntryProgress(entryId: entry!.id, progress: (entry!.progress ?? 0) + 1, status: nil)
                    }) {
                        if viewModel.isLoading {
                            ProgressView()
                            .frame(height: 13)
                        } else {
                            Text("+1")
                        }
                    }
                    .tint(Color(hex: entry!.media?.coverImage?.color))
                }
            } else {
                Text("Error no entry")
            }
        }
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct UpdateMediaEntryView_Previews: PreviewProvider {
    static var previews: some View {
        UpdateMediaEntryView(entry: nil, viewModel: MediaListViewModel())
    }
}
