//
//  GenreTagSelectionView.swift
//  AniHyou
//
//  Created by Axel Lopez on 04/01/2023.
//

import SwiftUI

struct GenreTagSelectionView: View {
    
    @ObservedObject var viewModel: SearchViewModel
    var onDone: () -> Void
    @State private var selectionType: Int = 0
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        VStack {
            HStack {
                Button("Clear", role: .destructive) {
                    viewModel.selectedGenres = []
                    viewModel.selectedTags = []
                }
                Spacer()
                Button(action: {
                    onDone()
                    dismiss()
                }) {
                    Text("Done").bold()
                }
            }
            .padding(.horizontal)
            .padding(.top)
            
            Picker("Selection type", selection: $selectionType) {
                Text("Genres").tag(0)
                Text("Tags").tag(1)
            }
            .pickerStyle(.segmented)
            .padding()
            
            if selectionType == 1 {
                if viewModel.tagCollection == nil {
                    ProgressView()
                        .onAppear {
                            //viewModel.getGenreTagCollection()
                        }
                    Spacer()
                } else {
                    List(viewModel.tagCollection!, selection: $viewModel.selectedTags) { tag in
                        Text(tag.id)
                    }
                }
            } else {
                if viewModel.genreCollection == nil {
                    ProgressView()
                        .onAppear {
                            viewModel.getGenreTagCollection()
                        }
                    Spacer()
                } else {
                    List(viewModel.genreCollection!, selection: $viewModel.selectedGenres) { genre in
                        Text(genre.id)
                    }
                }
            }
        }//:VStack
        .environment(\.editMode, .constant(.active))
    }
    
}

struct GenreTagSelectionView_Previews: PreviewProvider {
    static var previews: some View {
        GenreTagSelectionView(viewModel: SearchViewModel()) {}
    }
}
