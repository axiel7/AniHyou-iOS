//
//  CharacterStaffViewModel.swift
//  AniHyou
//
//  Created by Axel Lopez on 17/08/2022.
//

import Foundation
import AniListAPI

@MainActor
@Observable class CharacterStaffViewModel {

    var mediaCharactersAndStaff: MediaCharactersAndStaffQuery.Data.Media?

    func getMediaCharactersAndStaff(mediaId: Int) async {
        if let result = await MediaRepository.getMediaCharactersAndStaff(mediaId: Int32(mediaId)) {
            mediaCharactersAndStaff = result
        }
    }
}
