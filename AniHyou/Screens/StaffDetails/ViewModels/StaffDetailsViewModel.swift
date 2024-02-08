//
//  StaffDetailsViewModel.swift
//  AniHyou
//
//  Created by Axel Lopez on 09/11/2022.
//

import Foundation
import AniListAPI

class StaffDetailsViewModel: ObservableObject {

    @Published var staff: StaffDetailsQuery.Data.Staff?

    func getStaffDetails(staffId: Int) {
        Network.shared.apollo.fetch(query: StaffDetailsQuery(staffId: .some(staffId))) { [weak self] result in
            switch result {
            case .success(let graphQLResult):
                if let staff = graphQLResult.data?.staff {
                    self?.staff = staff
                }
            case .failure(let error):
                print(error)
            }
        }
    }

    func toggleFavorite() {
        guard let staff else { return }
        Network.shared.apollo.perform(mutation: ToggleFavouriteMutation(
            animeId: .none,
            mangaId: .none,
            characterId: .none,
            staffId: .some(staff.id),
            studioId: .none
        )) { [weak self] result in
            switch result {
            case .success(let graphQLResult):
                if graphQLResult.data != nil {
                    self?.onFavoriteToggled()
                }
            case .failure(let error):
                print(error)
            }
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

    func getStaffMedia(staffId: Int) {
        Network.shared.apollo.fetch(query: StaffMediaQuery(
            staffId: .some(staffId),
            onList: someIfNotNil(mediaOnMyList),
            page: .some(pageMedia),
            perPage: .some(25)
        )) { [weak self] result in
            switch result {
            case .success(let graphQLResult):
                if let media = graphQLResult.data?.staff?.staffMedia {
                    if let edges = media.edges {
                        var mediaGroupDict = [Int: StaffMediaGrouped]()
                        Dictionary(grouping: edges, by: { $0?.node?.id ?? 0 }).forEach { mediaId, value in
                            mediaGroupDict[mediaId] = StaffMediaGrouped(
                                value: value[0]!,
                                staffRoles: value.map { $0?.staffRole ?? "" }
                            )
                        }
                        let sortedDict = mediaGroupDict.values.sorted(by: { first, second in
                            return first.value.node?.startDate?.fragments.fuzzyDateFragment.isoString() ?? "30001231" >
                            second.value.node?.startDate?.fragments.fuzzyDateFragment.isoString() ?? "30001231"
                        })
                        self?.staffMedia.append(contentsOf: sortedDict)
                    }

                    self?.pageMedia = (media.pageInfo?.currentPage ?? self?.pageMedia ?? 1) + 1
                    self?.hasNextPageMedia = media.pageInfo?.hasNextPage ?? false
                }
            case .failure(let error):
                print(error)
            }
        }
    }

    func resetStaffMedia() {
        pageMedia = 1
        staffMedia.removeAll()
        hasNextPageMedia = true
    }

    @Published var staffCharacters = [StaffCharacterQuery.Data.Staff.CharacterMedia.Edge?]()
    var pageCharacters = 1
    var hasNextPageCharacters = true

    func getStaffCharacters(staffId: Int) {
        Network.shared.apollo.fetch(query: StaffCharacterQuery(
            staffId: .some(staffId),
            page: .some(pageCharacters),
            perPage: .some(25)
        )) { [weak self] result in
            switch result {
            case .success(let graphQLResult):
                if let characters = graphQLResult.data?.staff?.characterMedia {
                    self?.staffCharacters.append(contentsOf: characters.edges ?? [])
                    self?.pageCharacters = (characters.pageInfo?.currentPage ?? self?.pageCharacters ?? 1) + 1
                    self?.hasNextPageCharacters = characters.pageInfo?.hasNextPage ?? false
                }
            case .failure(let error):
                print(error)
            }
        }
    }

    // MARK: calculated variables

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
