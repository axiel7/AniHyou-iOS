//
//  ProfileAboutView.swift
//  AniHyou
//
//  Created by Axel Lopez on 22/7/22.
//

import SwiftUI
import RichText

struct UserAboutView: View {
    
    var userId: Int
    @StateObject private var viewModel = ProfileViewModel()
    
    var body: some View {
        ScrollView(.vertical) {
            if viewModel.userAbout != nil {
                RichText(html: viewModel.userAbout!)
                    .defaultStyle()
                    .padding()
            } else {
                HStack {
                    Spacer()
                    ProgressView()
                    Spacer()
                }
            }
        }
        .onAppear {
            viewModel.getUserAbout(userId: userId)
        }
    }
}

struct UserAboutView_Previews: PreviewProvider {
    static var previews: some View {
        UserAboutView(userId: 208863)
    }
}
