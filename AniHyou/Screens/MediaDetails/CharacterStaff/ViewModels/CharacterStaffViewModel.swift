//
//  CharacterStaffViewModel.swift
//  AniHyou
//
//  Created by Axel Lopez on 17/08/2022.
//

import Foundation

class CharacterStaffViewModel: ObservableObject {
    
    @Published var mediaCharactersAndStaff: MediaCharactersAndStaffQuery.Data.Media?
    
    func getMediaCharactersAndStaff(mediaId: Int) {
        Network.shared.apollo.fetch(query: MediaCharactersAndStaffQuery(mediaId: .some(mediaId))) { [weak self] result in
            switch result {
            case .success(let graphQLResult):
                if let media = graphQLResult.data?.media {
                    self?.mediaCharactersAndStaff = media
                }
            case .failure(let error):
                print(error)
            }
        }
    }
    
}
