//
//  ProfileAboutView.swift
//  AniHyou
//
//  Created by Axel Lopez on 22/7/22.
//

import SwiftUI

struct UserAboutView: View {
    
    var userId: Int
    @StateObject private var viewModel = ProfileViewModel()
    
    var body: some View {
        VStack {
            if !viewModel.userAbout.isEmpty {
                WebView(htmlString: $viewModel.userAbout, baseURL: .constant(nil))
            } else {
                ProgressView()
            }
        }
        .navigationTitle("About")
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
