//
//  AccountSettingsView.swift
//  AniHyou
//
//  Created by Axel Lopez on 15/10/2023.
//

import SwiftUI
import AniListAPI

struct AccountSettingsView: View {
    
    @ObservedObject var viewModel: SettingsViewModel
    @State private var showChangesAlert = false
    
    var body: some View {
        Group {
            if viewModel.areOptionsFetched {
                Form {
                    Section {
                        Picker("Title language", selection: $viewModel.titleLanguage) {
                            ForEach(UserTitleLanguage.allCasesNormal, id: \.self) { lang in
                                Text(lang.localizedName).tag(lang)
                            }
                        }
                        .onChange(of: viewModel.titleLanguage) { lang in
                            viewModel.updateUserOptions(titleLanguage: lang)
                            showChangesAlert = true
                        }
                        Picker("Staff & Character name language", selection: $viewModel.staffNameLanguage) {
                            ForEach(UserStaffNameLanguage.allCases, id: \.self) { lang in
                                Text(lang.localizedName).tag(lang)
                            }
                        }
                        .onChange(of: viewModel.staffNameLanguage) { lang in
                            viewModel.updateUserOptions(staffNameLanguage: lang)
                            showChangesAlert = true
                        }
                        Picker("Score format", selection: $viewModel.scoreFormat) {
                            ForEach(ScoreFormat.allCases, id: \.self) { format in
                                Text(format.localizedName).tag(format)
                            }
                        }
                        .onChange(of: viewModel.scoreFormat) { format in
                            viewModel.updateUserOptions(scoreFormat: format)
                            showChangesAlert = true
                        }
                    } header: {
                        Text("Content")
                    }
                    .alert(
                        "",
                        isPresented: $showChangesAlert,
                        actions: {
                            Button("Close", role: .cancel) {}
                        },
                        message: {
                            Text("Changes will take effect on app restart")
                        }
                    )
                    
                    Section {
                        Link("Other account settings", destination: URL(string: "https://anilist.co/settings/account")!)
                    } footer: {
                        Text("You may need to login again in your browser")
                    }
                }//:Form
            } else {
                ProgressView()
                    .onAppear {
                        viewModel.getUserOptions()
                    }
            }
        }//:Group
        .navigationTitle("Account settings")
    }
}

#Preview {
    AccountSettingsView(viewModel: SettingsViewModel())
}
