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
    
    private var customLists: [String]? {
        UserDefaults.standard.stringArray(forKey: mediaType.customListsKey)
    }

    var body: some View {
        NavigationSplitView {
            List(selection: $selection) {
                Label("All", systemImage: "list.bullet.circle").tag("All")
                ForEach(MediaListStatus.allCases, id: \.rawValue) { status in
                    Label(
                        status.localizedName(type: mediaType),
                        systemImage: status.systemImage
                    )
                    .tag(status.localizedStringKey(type: mediaType))
                }
                if let customLists {
                    ForEach(customLists, id: \.self) { name in
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
        .onChange(of: selection) { value in
            if let value {
                UserDefaults.standard.setValue(value, forKey: mediaType.listStatusKey)
                Task {
                    viewModel.onChangeList(value)
                }
            }
        }
        .onAppear {
            let selectedList = UserDefaults.standard.string(forKey: mediaType.listStatusKey)
            viewModel.mediaType = mediaType
            if let selectedList {
                selection = selectedList
                Task {
                    viewModel.onChangeList(selectedList)
                }
            }
        }
    }
}

#Preview {
    MediaListStatusView(mediaType: .anime)
}
