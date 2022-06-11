//
//  ProfileViewModel.swift
//  AniHyou
//
//  Created by Axel Lopez on 10/6/22.
//

import Foundation

class ProfileViewModel: ObservableObject {
    
    @Published var userInfo: ViewerQuery.Data.Viewer?
    
    func getUserInfo() {
        Network.shared.apollo.fetch(query: ViewerQuery()) { result in
            switch result {
            case .success(let graphQLResult):
                if let viewer = graphQLResult.data?.viewer {
                    self.userInfo = viewer
                }
            case .failure(let error):
                print(error)
            }
        }
    }
    
}
