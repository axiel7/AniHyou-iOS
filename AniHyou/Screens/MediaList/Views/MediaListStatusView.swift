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
    @AppStorage(LIST_STATUS_KEY) private var selectedList: String?
    @State private var showingMediaDetails = false
    @State private var mediaId = 0
    
    private var customLists: [String]? {
        UserDefaults.standard.stringArray(forKey: mediaType.customListsKey)
    }

    var body: some View {
        NavigationSplitView {
            List(selection: $selectedList) {
                Label("All", systemImage: "list.bullet.circle").tag("All")
                ForEach(MediaListStatus.allCases, id: \.localizedStringKey) { status in
                    if status == .current {
                        Label(mediaType.currentListStatus, systemImage: status.systemImage)
                    } else {
                        Label(status.localizedName, systemImage: status.systemImage)
                    }
                }
                if let customLists {
                    ForEach(customLists, id: \.self) { name in
                        Label(name, systemImage: "list.bullet")
                    }
                }
            }
            .navigationTitle(mediaType == .anime ? "Anime List" : "Manga List")
        } detail: {
            if let selectedList {
                NavigationStack {
                    MediaListView(type: mediaType, userId: userId, viewModel: viewModel)
                        .id(selectedList)
                        .addOnOpenMediaUrl($showingMediaDetails, $mediaId)
                }
            }
        }//:NavigationSplitView
        .onChange(of: selectedList) { value in
            if let value {
                viewModel.onChangeList(value)
            }
        }
        .onAppear {
            viewModel.mediaType = mediaType
            if let selectedList {
                viewModel.onChangeList(selectedList)
            }
        }
    }
}

#Preview {
    MediaListStatusView(mediaType: .anime)
}
