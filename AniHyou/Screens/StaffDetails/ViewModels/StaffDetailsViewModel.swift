//
//  StaffDetailsViewModel.swift
//  AniHyou
//
//  Created by Axel Lopez on 09/11/2022.
//

import Foundation
import AniListAPI

@MainActor
class StaffDetailsViewModel: ObservableObject {

    @Published var staff: StaffDetailsQuery.Data.Staff?

    func getStaffDetails(staffId: Int) async {
        staff = await StaffRepository.getStaffDetails(staffId: staffId)
    }

    func toggleFavorite() async {
        guard let staff else { return }
        if await FavoritesRepository.toggleFavorite(staffId: staff.id) != nil {
            onFavoriteToggled()
        }
    }

    func onFavoriteToggled() {
        guard let staffId = staff?.id else { return }
        Network.shared.apollo.store.withinReadWriteTransaction({ [weak self] transaction in
            do {
                try transaction.updateObject(
                    ofType: IsFavouriteStaff.self,
                    withKey: "Staff:\(staffId)"
                ) { (cachedData: inout IsFavouriteStaff) in
                    cachedData.isFavourite = !cachedData.isFavourite
                }
                let newObject = try transaction.readObject(
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

    @Published var mediaOnMyList: Bool?
    @Published var staffMedia = [StaffMediaGrouped]()
    var pageMedia = 1
    var hasNextPageMedia = true

    func getStaffMedia(staffId: Int) async {
        if let result = await StaffRepository.getStaffMedia(
            staffId: staffId,
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

    @Published var staffCharacters = [StaffCharacterQuery.Data.Staff.CharacterMedia.Edge]()
    var pageCharacters = 1
    var hasNextPageCharacters = true

    func getStaffCharacters(staffId: Int) async {
        if let result = await StaffRepository.getStaffCharacters(staffId: staffId, page: pageCharacters) {
            staffCharacters.append(contentsOf: result.data)
            pageCharacters = result.page
            hasNextPageCharacters = result.hasNextPage
        }
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
