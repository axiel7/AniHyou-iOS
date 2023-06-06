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
    
    @Published var mediaOnMyList = false
    @Published var staffMedia = [StaffMediaGrouped]()
    var pageMedia = 1
    var hasNextPageMedia = true
    
    func getStaffMedia(staffId: Int) {
        var mediaOnListValue = GraphQLNullable<Bool>.none
        if mediaOnMyList { mediaOnListValue = .some(true) }
        Network.shared.apollo.fetch(query: StaffMediaQuery(staffId: .some(staffId), onList: mediaOnListValue, page: .some(pageMedia), perPage: .some(25))) { [weak self] result in
            switch result {
            case .success(let graphQLResult):
                if let media = graphQLResult.data?.staff?.staffMedia {
                    if let edges = media.edges {
                        var mediaGroupDict = Dictionary<Int, StaffMediaGrouped>()
                        Dictionary(grouping: edges, by: { $0?.node?.id ?? 0 }).forEach { mediaId, value in
                            mediaGroupDict[mediaId] = StaffMediaGrouped(value: value[0]!, staffRoles: value.map { $0?.staffRole ?? "" })
                        }
                        self?.staffMedia.append(contentsOf: mediaGroupDict.values)
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
        Network.shared.apollo.fetch(query: StaffCharacterQuery(staffId: .some(staffId), page: .some(pageCharacters), perPage: .some(25))) { [weak self] result in
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
    
    //MARK: calculated variables
    
    var yearsActiveFormatted: String {
        guard staff?.yearsActive != nil else { return "Unknown" }
        guard staff?.yearsActive?.isEmpty == false else { return "Unknown" }
        if let startYear = staff!.yearsActive![0] {
            if staff!.yearsActive!.count > 1, let endYear = staff!.yearsActive![1] {
                return "\(startYear)-\(endYear)"
            } else {
                return "\(startYear)-Present"
            }
        } else {
            return "Unknown"
        }
    }
    
    var occupationsFormatted: String {
        guard staff?.primaryOccupations != nil else { return "Unknown" }
        return staff!.primaryOccupations!.compactMap { $0 }.joined(separator: ", ")
    }
}
