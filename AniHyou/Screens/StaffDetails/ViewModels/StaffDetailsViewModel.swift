//
//  StaffDetailsViewModel.swift
//  AniHyou
//
//  Created by Axel Lopez on 09/11/2022.
//

import Foundation

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
