//
//  GenreTagSelectionView.swift
//  AniHyou
//
//  Created by Axel Lopez on 04/01/2023.
//

import SwiftUI

struct GenreTagSelectionView: View {

    @ObservedObject var viewModel: SearchViewModel
    let onDone: () -> Void
    @State private var selectionType: Int = 0
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        NavigationStack {
            VStack {
                Picker("Selection type", selection: $selectionType) {
                    Text("Genres").tag(0)
                    Text("Tags").tag(1)
                }
                .pickerStyle(.segmented)
                .padding()

                if selectionType == 1 {
                    if viewModel.tagCollection == nil {
                        HorizontalProgressView()
                            .onAppear {
                                viewModel.getGenreTagCollection()
                            }
                        Spacer()
                    } else {
                        List(viewModel.filteredTags, selection: $viewModel.selectedTags) { tag in
                            Text(tag.id)
                        }
                    }
                } else {
                    if viewModel.genreCollection == nil {
                        HorizontalProgressView()
                            .onAppear {
                                viewModel.getGenreTagCollection()
                            }
                        Spacer()
                    } else {
                        List(viewModel.filteredGenres, selection: $viewModel.selectedGenres) { genre in
                            if let localized = genre.id.genreLocalized {
                                Text(localized)
                            } else {
                                Text(genre.id)
                            }
                        }
                    }
                }
            }//:VStack
            .environment(\.editMode, .constant(.active))
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Clear", role: .destructive) {
                        viewModel.selectedGenres = []
                        viewModel.selectedTags = []
                    }
                    .tint(.red)
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    if #available(iOS 26, *) {
                        Button(
                            action: {
                                onDone()
                                dismiss()
                            }
                        ) {
                            Label("Done", systemImage: "checkmark")
                        }
                        .buttonStyle(.borderedProminent)
                    } else {
                        Button(
                            action: {
                                onDone()
                                dismiss()
                            },
                            label: {
                                Text("Done").bold()
                            }
                        )
                    }
                }
            }
        }//:NavigationStack
        .searchable(text: $viewModel.filterGenreTagText)
    }
}

#Preview {
    GenreTagSelectionView(viewModel: SearchViewModel()) {}
}
