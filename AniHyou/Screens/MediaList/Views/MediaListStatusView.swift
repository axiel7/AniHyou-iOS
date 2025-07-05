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
    @StateObject private var viewModel = MediaListViewModel()
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
                        .id(selection)
                        .addOnOpenMediaUrl($showingMediaDetails, $mediaId)
                }
            }
        }//:NavigationSplitView
        .onChange(of: selection) {
            if let selection {
                UserDefaults.standard.setValue(selection, forKey: mediaType.listStatusKey)
                Task {
                    viewModel.onChangeList(selection)
                }
            }
        }
        .onAppear {
            let selectedList = UserDefaults.standard.string(forKey: mediaType.listStatusKey)
            viewModel.mediaType = mediaType
            if let userId {
                viewModel.userId = userId
            }
            if let selectedList {
                selection = selectedList
                Task {
                    viewModel.onChangeList(selectedList)
                }
            } else if viewModel.listNames.isEmpty {
                Task {
                    await viewModel.refreshList()
                }
            }
        }
    }
}

#Preview {
    MediaListStatusView(mediaType: .anime)
}
