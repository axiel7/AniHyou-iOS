//
//  StaffDetailsView.swift
//  AniHyou
//
//  Created by Axel Lopez on 09/11/2022.
//

import SwiftUI
import RichText

struct StaffDetailsView: View {
    
    var staffId: Int
    @StateObject private var viewModel = StaffDetailsViewModel()
    
    var body: some View {
        if viewModel.staff != nil {
            ScrollView(.vertical) {
                VStack(alignment: .center) {
                    CircleImageView(imageUrl: viewModel.staff!.image?.large, size: 150)
                    
                    Text(viewModel.staff!.name?.userPreferred ?? "")
                        .font(.title3.weight(.bold))
                        .multilineTextAlignment(.center)
                    
                    Text(viewModel.staff!.name?.native ?? "")
                        .font(.subheadline)
                        .multilineTextAlignment(.center)
                        .foregroundColor(.gray)
                    
                    HStack {
                        VStack(alignment: .leading) {
                            HInfoView(name: "Birth", value: viewModel.staff!.dateOfBirth?.fragments.fuzzyDate.formatted())
                            if viewModel.staff!.dateOfDeath?.year != nil {
                                HInfoView(name: "Death", value: viewModel.staff!.dateOfDeath?.fragments.fuzzyDate.formatted())
                            }
                            HInfoView(name: "Age", value: viewModel.staff!.age?.stringValue)
                            HInfoView(name: "Gender", value: viewModel.staff!.gender)
                            HInfoView(name: "Blood Type", value: viewModel.staff?.bloodType)
                            HInfoView(name: "Years active", value: viewModel.yearsActiveFormatted)
                            HInfoView(name: "Hometown", value: viewModel.staff!.homeTown, isExpandable: true)
                            HInfoView(name: "Occupations", value: viewModel.occupationsFormatted)
                            
                            RichText(html: viewModel.staff!.description ?? "")
                                .defaultStyle()
                        }
                    }
                }
            }
        } else {
            ProgressView()
                .onAppear {
                    viewModel.getStaffDetails(staffId: staffId)
                }
        }
    }
}

struct StaffDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        StaffDetailsView(staffId: 97836)
    }
}
