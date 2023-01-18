//
//  MediaListEditView.swift
//  AniHyou
//
//  Created by Axel Lopez on 20/6/22.
//

import SwiftUI
import API

struct MediaListEditView: View {
    @Environment(\.dismiss) private var dismiss
    
    var mediaId: Int
    var mediaType: MediaType
    var mediaList: BasicMediaListEntry?
    var onSave: () -> Void = {}
    
    @StateObject private var viewModel = MediaListEditViewModel()
    @State private var showDeleteDialog = false
    
    @State private var status: MediaListStatus = .planning
    @State private var progress = 0
    @State private var progressVolumes = 0
    @State private var startDate = Date()
    @State private var isStartDateSet = false
    @State private var finishDate = Date()
    @State private var isFinishDateSet = false
    @State private var showStartDate = false
    @State private var showFinishDate = false
    
    private let formatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        return formatter
    }()
    
    var body: some View {
        NavigationView {
            Form(content: {
                Picker("Status", selection: $status) {
                    ForEach(MediaListStatus.allCases, id: \.self) { status in
                        Label(status.localizedName, systemImage: status.systemImage)
                    }
                }
                
                Section("Score") {
                    switch viewModel.scoreFormat {
                    case .point5:
                        HStack {
                            Spacer()
                            StarRatingView(rating: $viewModel.score)
                            Spacer()
                        }
                    case .point3:
                        HStack {
                            Spacer()
                            SmileyRatingView(rating: $viewModel.score)
                            Spacer()
                        }
                    default:
                        HStack {
                            TextField("", value: $viewModel.score, formatter: formatter)
                                .keyboardType(.decimalPad)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                                .frame(width: 80)
                            
                            Stepper("/\(viewModel.scoreHint)", value: $viewModel.score, in: viewModel.scoreRange, step: viewModel.scoreStep)
                        }
                    }
                }
                
                Section("Progress") {
                    HStack {
                        TextField("", value: $progress, formatter: NumberFormatter())
                            .keyboardType(.numberPad)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .frame(width: 80)
                        Stepper(mediaType == .anime ? "Episodes" : "Chapters", value: $progress, in: 0...Int.max)
                    }
                    if mediaType == .manga {
                        HStack {
                            TextField("", value: $progressVolumes, formatter: NumberFormatter())
                                .keyboardType(.numberPad)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                                .frame(width: 80)
                            Stepper("Volumes", value: $progressVolumes, in: 0...Int.max)
                        }
                    }
                }
                
                Section("Dates") {
                    DatePickerToggleView(text: "Start Date", selection: $startDate, isDateSet: $isStartDateSet)
                    DatePickerToggleView(text: "Finish Date", selection: $finishDate, isDateSet: $isFinishDateSet)
                }
                
                Button("Delete", role: .destructive) {
                    showDeleteDialog = true
                }
                .confirmationDialog("Delete this entry?", isPresented: $showDeleteDialog) {
                    Button("Delete", role: .destructive) {
                        viewModel.deleteEntry(entryId: mediaList!.id)
                    }
                } message: {
                    Text("Delete this entry?")
                }
                .disabled(mediaList == nil)
                
            })//:Form
            .navigationBarTitleDisplayMode(.inline)
            .toolbar(content: {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Cancel") {
                        dismiss()
                    }
                }
                    
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Save", action: {
                        viewModel.updateEntry(mediaId: mediaId, status: status, score: viewModel.score, progress: progress, progressVolumes: progressVolumes, startedAt: isStartDateSet ? startDate : nil, completedAt: isFinishDateSet ? finishDate : nil)
                    })
                    .font(.bold(.body)())
                    
                }
            })//:Toolbar
        }//:NavigationView
        .onAppear {
            setValues()
        }
        .onChange(of: viewModel.isUpdateSuccess) { isUpdateSuccess in
            if isUpdateSuccess {
                onSave()
                dismiss()
            }
        }
    }
    
    private func setValues() {
        self.status = self.mediaList?.status?.value ?? .planning
        self.progress = self.mediaList?.progress ?? 0
        self.progressVolumes = self.mediaList?.progressVolumes ?? 0
        viewModel.score = self.mediaList?.score ?? 0
        if let startedYear = self.mediaList?.startedAt?.year {
            if let startedMonth = self.mediaList?.startedAt?.month {
                if let startedDay = self.mediaList?.startedAt?.day {
                    if let startDate = date(year: startedYear, month: startedMonth, day: startedDay) {
                        self.startDate = startDate
                    }
                }
            }
        }
        self.isStartDateSet = self.mediaList?.startedAt?.year != nil
        
        if let completedYear = self.mediaList?.completedAt?.year {
            if let completedMonth = self.mediaList?.completedAt?.month {
                if let completedDay = self.mediaList?.completedAt?.day {
                    if let finishDate = date(year: completedYear, month: completedMonth, day: completedDay) {
                        self.finishDate = finishDate
                    }
                }
            }
        }
        self.isFinishDateSet = self.mediaList?.completedAt?.year != nil
    }
}

struct MediaListEditView_Previews: PreviewProvider {
    static var previews: some View {
        MediaListEditView(mediaId: 1, mediaType: .anime)
    }
}
