//
//  UpdateMediaEntryView.swift
//  AniHyouShou Watch App
//
//  Created by Axel Lopez on 12/01/2023.
//

import SwiftUI

struct UpdateMediaEntryView: View {
    
    var entry: UserMediaListQuery.Data.Page.MediaList?
    @ObservedObject var viewModel: MediaListViewModel
    @State private var currentProgress = 0
    
    var body: some View {
        Group {
            if entry != nil {
                VStack(alignment: .leading) {
                    Text(entry!.media?.title?.userPreferred ?? "")
                        .font(.title3)
                    Spacer()
                    
                    Text("\(currentProgress)/\(entry!.totalProgress ?? 0)")

                    Button("+1") {
                        viewModel.updateEntryProgress(entryId: entry!.id, progress: entry!.progress! + 1)
                    }
                }
            } else {
                Text("Error no entry")
            }
        }
        .navigationTitle("Back")
        .navigationBarTitleDisplayMode(.inline)
        .onAppear {
            currentProgress = entry?.progress ?? 0
        }
        .onChange(of: viewModel.updatedEntry) { updatedEntry in
            currentProgress = updatedEntry.progress ?? currentProgress
        }
    }
}

struct UpdateMediaEntryView_Previews: PreviewProvider {
    static var previews: some View {
        UpdateMediaEntryView(entry: nil, viewModel: MediaListViewModel())
    }
}
