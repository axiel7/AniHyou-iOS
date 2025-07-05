//
//  MediaDetailsMainInfo.swift
//  AniHyou
//
//  Created by Axel Lopez on 23/7/22.
//

import SwiftUI

private let coverWidth: CGFloat = 110
private let coverHeight: CGFloat = 153

struct MediaDetailsMainInfo: View {

    let mediaId: Int
    @ObservedObject var viewModel: MediaDetailsViewModel
    @State private var showingEditSheet = false
    @State private var showingCoverSheet = false
    @State private var showingNotLoggedAlert = false
    @State private var showingPlayPopover = false
    @AppStorage(LOGGED_IN_KEY) private var isLoggedIn: Bool = false

    var body: some View {
        HStack(alignment: .top) {

            Button(action: { showingCoverSheet.toggle() }) {
                MediaCoverView(
                    imageUrl: viewModel.mediaDetails?.coverImage?.large,
                    width: coverWidth,
                    height: coverHeight
                )
            }

            VStack(alignment: .leading) {

                Text(viewModel.mediaDetails?.title?.userPreferred ?? "")
                    .font(.title3)
                    .bold()
                    .lineLimit(3)
                    .padding(.bottom, 1)
                    .textSelection(.enabled)

                Text(viewModel.mediaDetails?.format?.value?.localizedName ?? "Unknown")
                    .font(.subheadline)
                    .foregroundStyle(.gray)

                Spacer()

                HStack {
                    // MARK: Status button
                    Button {
                        if isLoggedIn {
                            showingEditSheet = true
                        } else {
                            showingNotLoggedAlert = true
                        }
                    } label: {
                        if viewModel.isNewEntry {
                            Label("Add to List", systemImage: "plus")
                                .font(.system(size: 17, weight: .bold))
                                .textCase(.uppercase)
                        } else {
                            Label(viewModel.listEntry?.status?.value?.localizedName ?? "",
                                  systemImage: "square.and.pencil"
                            )
                            .font(.system(size: 17, weight: .bold))
                            .textCase(.uppercase)
                        }
                    }//:Button
                    .buttonStyleGlassProminentCompat()
                    .alert("Please login to use this feature", isPresented: $showingNotLoggedAlert) {
                        Button("OK", role: .cancel) { }
                    }
                    if isPhone {
                        Spacer()
                    }
                    ShareLink(item: viewModel.mediaShareLink ?? "") {
                        Label("Share", systemImage: "square.and.arrow.up")
                    }
                    .padding(.horizontal)
                    .labelStyle(.iconOnly)
                }//:HStack
            }//:VStack
            .padding(.leading, 12)
            .padding(.trailing, 8)
        }//:HStack
        .padding(.top)
        .padding(.leading)
        .sheet(isPresented: $showingCoverSheet) {
            FullCoverView(imageUrl: viewModel.mediaDetails?.coverImage?.extraLarge)
        }
        .sheet(isPresented: $showingEditSheet) {
            MediaListEditView(
                mediaDetails: viewModel.mediaDetails!.fragments.basicMediaDetails,
                mediaList: viewModel.listEntry,
                onSave: { updatedEntry in
                    viewModel.onEntryUpdated(updatedEntry: updatedEntry)
                },
                onDelete: {
                    viewModel.onEntryDeleted()
                }
            )
        }
    }
}

#Preview {
    MediaDetailsMainInfo(mediaId: 1, viewModel: MediaDetailsViewModel())
}
