//
//  MediaStatusView.swift
//  AniHyou
//
//  Created by Axel Lopez on 18/6/22.
//

import SwiftUI
import AniListAPI

struct MediaListStatusView: View {

    let mediaType: MediaType
    var userId: Int?
    @State private var viewModel = MediaListViewModel()
    @State private var selection: String?
    @State private var showingMediaDetails = false
    @State private var mediaId = 0

    var body: some View {
        NavigationSplitView {
            List(selection: $selection) {
                Label("All", systemImage: "list.bullet.circle").tag("All")
                ForEach(viewModel.listNames, id: \.self) { name in
                    if let status = name.asMediaListStatus() {
                        Label(
                            name.localizedListStatus(mediaType: mediaType),
                            systemImage: status.systemImage
                        )
                    } else {
                        Label(name, systemImage: "list.bullet")
                    }
                }
            }
            .navigationTitle(mediaType == .anime ? "Anime List" : "Manga List")
        } detail: {
            if let selection {
                NavigationStack {
                    MediaListView(type: mediaType, userId: userId, viewModel: viewModel)
                        .id("\(selection)\(userId ?? 0)")
                        .addOnOpenMediaUrl($showingMediaDetails, $mediaId)
                }
            }
        }//:NavigationSplitView
        .onChange(of: selection) {
            if let selection {
                if userId == nil {
                    UserDefaults.standard.setValue(selection, forKey: mediaType.listStatusKey)
                }
                Task {
                    viewModel.onChangeList(selection)
                }
            }
        }
        .task {
            viewModel.mediaType = mediaType
            if let userId {
                viewModel.userId = userId
                await viewModel.refreshList()
            } else {
                if let selectedList = UserDefaults.standard.string(forKey: mediaType.listStatusKey) {
                    selection = selectedList
                    viewModel.onChangeList(selectedList)
                } else if viewModel.listNames.isEmpty {
                    await viewModel.refreshList()
                }
            }
        }
    }
}

#Preview {
    MediaListStatusView(mediaType: .anime)
}
