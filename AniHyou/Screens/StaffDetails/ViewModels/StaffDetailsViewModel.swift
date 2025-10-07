//
//  StaffDetailsViewModel.swift
//  AniHyou
//
//  Created by Axel Lopez on 09/11/2022.
//

import Foundation
import AniListAPI

@MainActor
@Observable class StaffDetailsViewModel {

    var staff: StaffDetailsQuery.Data.Staff?

    func getStaffDetails(staffId: Int) async {
        staff = await StaffRepository.getStaffDetails(staffId: Int32(staffId))
    }

    func toggleFavorite() async {
        guard let staff else { return }
        if await FavoritesRepository.toggleFavorite(staffId: Int32(staff.id)) != nil {
            await onFavoriteToggled()
        }
    }

    func onFavoriteToggled() async {
        guard let staffId = staff?.id else { return }
        try? await Network.shared.apollo.store.withinReadWriteTransaction({ [weak self] transaction in
            do {
                try await transaction.updateObject(
                    ofType: IsFavouriteStaff.self,
                    withKey: "Staff:\(staffId)"
                ) { (cachedData: inout IsFavouriteStaff) in
                    cachedData.isFavourite = !cachedData.isFavourite
                }
                let newObject = try await transaction.readObject(
                    ofType: StaffDetailsQuery.Data.Staff.self,
                    withKey: "Staff:\(staffId)"
                )
                DispatchQueue.main.async {
                    self?.staff = newObject
                }
            } catch {
                print(error)
            }
        })
    }

    var mediaOnMyList: Bool?
    var staffMedia = [StaffMediaGrouped]()
    var pageMedia: Int32 = 1
    var hasNextPageMedia = true

    func getStaffMedia(staffId: Int) async {
        if let result = await StaffRepository.getStaffMedia(
            staffId: Int32(staffId),
            onMyList: mediaOnMyList,
            page: pageMedia
        ) {
            staffMedia.append(contentsOf: result.data)
            pageMedia = result.page
            hasNextPageMedia = result.hasNextPage
        }
    }

    func resetStaffMedia() {
        pageMedia = 1
        staffMedia.removeAll()
        hasNextPageMedia = true
    }

    var charactersOnMyList: Bool?
    var staffCharacters = [StaffCharacterQuery.Data.Staff.CharacterMedia.Edge]()
    var pageCharacters: Int32 = 1
    var hasNextPageCharacters = true

    func getStaffCharacters(staffId: Int) async {
        if let result = await StaffRepository.getStaffCharacters(
            staffId: Int32(staffId),
            onMyList: charactersOnMyList,
            page: pageCharacters
        ) {
            staffCharacters.append(contentsOf: result.data)
            pageCharacters = result.page
            hasNextPageCharacters = result.hasNextPage
        }
    }
    
    func resetStaffCharacters() {
        pageCharacters = 1
        staffCharacters.removeAll()
        hasNextPageCharacters = true
    }

    // MARK: - calculated variables

    var yearsActiveFormatted: String {
        guard let yearsActive = staff?.yearsActive else { return "Unknown" }
        guard !yearsActive.isEmpty else { return "Unknown" }
        if let startYear = yearsActive[0] {
            if yearsActive.count > 1, let endYear = yearsActive[1] {
                return "\(startYear)-\(endYear)"
            } else {
                return "\(startYear)-Present"
            }
        } else {
            return "Unknown"
        }
    }

    var occupationsFormatted: String {
        guard let occupations = staff?.primaryOccupations else { return "Unknown" }
        return occupations.compactMap { $0 }.joined(separator: ", ")
    }
}
