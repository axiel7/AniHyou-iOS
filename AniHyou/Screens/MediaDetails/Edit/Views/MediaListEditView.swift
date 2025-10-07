//
//  MediaListEditView.swift
//  AniHyou
//
//  Created by Axel Lopez on 20/6/22.
//

import SwiftUI
import AniListAPI

// swiftlint:disable:next type_body_length
struct MediaListEditView: View {
    @Environment(\.dismiss) private var dismiss

    let mediaDetails: BasicMediaDetails?
    var mediaList: BasicMediaListEntry?
    var onSave: (_ updatedEntry: BasicMediaListEntry) async -> Void = { _ in }
    var onDelete: () async -> Void = {}

    @State private var viewModel = MediaListEditViewModel()
    @State private var showDeleteDialog = false
    
    @AppStorage(ADVANCED_SCORING_ENABLED_KEY) private var advancedScoringEnabled: Bool?

    @State private var status: MediaListStatus = .planning
    @State private var progress: Int?
    @State private var progressVolumes: Int?
    @State private var repeatCount: Int?
    @State private var startDate = Date()
    @State private var isStartDateSet = false
    @State private var finishDate = Date()
    @State private var isFinishDateSet = false
    @State private var showStartDate = false
    @State private var showFinishDate = false
    @State private var isPrivate = false
    @State private var isHiddenFromStatusLists = false
    @State private var notes = ""
    @State private var advancedScores: [String: Double] = [:]
    @State private var customLists: [String: Bool] = [:]

    private let textFieldWidth: CGFloat = 65
    private let decimalFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        return formatter
    }()

    var body: some View {
        NavigationStack {
            Form(content: {
                Picker("Status", selection: $status) {
                    ForEach(MediaListStatus.allCases, id: \.self) { status in
                        Label(status.localizedName, systemImage: status.systemImage)
                    }
                }
                .onChange(of: status) {
                    if status == .completed {
                        progress = mediaDetails?.maxEpOrCh ?? progress
                        progressVolumes = mediaDetails?.volumes ?? progressVolumes
                        if !isFinishDateSet {
                            finishDate = .now
                            isFinishDateSet = true
                        }
                    } else if status == .current && !isStartDateSet {
                        startDate = .now
                        isStartDateSet = true
                    }
                }

                scoreSection
                
                progressSection

                Section("Dates") {
                    DatePickerToggleView(text: "Start Date", selection: $startDate, isDateSet: $isStartDateSet)
                    DatePickerToggleView(text: "Finish Date", selection: $finishDate, isDateSet: $isFinishDateSet)
                }
                
                Section {
                    NavigationLink("Custom lists") {
                        MediaCustomListsView(customLists: $customLists)
                    }
                }

                Section {
                    Toggle("Hide from status lists", isOn: $isHiddenFromStatusLists)
                    Toggle("Private", isOn: $isPrivate)
                }

                Section {
                    TextField("Notes", text: $notes, axis: .vertical)
                        .lineLimit(5)
                }
                
                if advancedScoringEnabled == true {
                    advancedScoresView
                }

                Button("Delete", role: .destructive) {
                    showDeleteDialog = true
                }
                .confirmationDialog("Delete this entry?", isPresented: $showDeleteDialog) {
                    Button("Delete", role: .destructive) {
                        Task {
                            await viewModel.deleteEntry()
                        }
                    }
                } message: {
                    Text("Delete this entry?")
                }
                .disabled(mediaList == nil)

            })//:Form
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                toolbarContent
            }//:Toolbar
        }//:NavigationStack
        .onAppear {
            setValues()
        }
        .onChange(of: viewModel.isUpdateSuccess) {
            if viewModel.isUpdateSuccess, let entry = viewModel.entry {
                Task {
                    await onSave(entry)
                    dismiss()
                }
            }
        }
        .onChange(of: viewModel.isDeleteSuccess) {
            if viewModel.isDeleteSuccess {
                Task {
                    await onDelete()
                    dismiss()
                }
            }
        }
    }
    
    @ViewBuilder
    private var scoreSection: some View {
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
                    TextField("0", value: $viewModel.score, formatter: decimalFormatter)
                        .keyboardType(.decimalPad)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .frame(width: textFieldWidth)

                    Stepper(
                        "/\(viewModel.scoreHint)",
                        onIncrement: {
                            if (viewModel.score ?? 0) < viewModel.scoreMax {
                                if viewModel.score == nil {
                                    viewModel.score = viewModel.scoreStep
                                } else {
                                    viewModel.score! += viewModel.scoreStep
                                }
                            }
                        },
                        onDecrement: {
                            if viewModel.score != nil && viewModel.score! > 0 {
                                if (viewModel.score! - viewModel.scoreStep) <= 0 {
                                    viewModel.score = nil
                                } else {
                                    viewModel.score! -= viewModel.scoreStep
                                }
                            }
                        }
                    )
                }
            }
        }
    }
    
    @ViewBuilder
    private var progressSection: some View {
        Section("Progress") {
            HStack {
                TextField("0", value: $progress, formatter: NumberFormatter())
                    .keyboardType(.numberPad)
                    .textFieldStyle(.roundedBorder)
                    .frame(width: textFieldWidth)
                    .onChange(of: progress) {
                        if let max = mediaDetails?.maxEpOrCh, (progress ?? 0) > max {
                            progress = max
                        }
                    }
                Stepper(
                    mediaDetails?.type == .anime ? "Episodes" : "Chapters",
                    onIncrement: {
                        let maxValue = mediaDetails?.maxEpOrCh
                        if maxValue == nil || (progress ?? 0) < maxValue! {
                            if progress == nil {
                                progress = 1
                            } else {
                                progress! += 1
                            }
                        }
                    },
                    onDecrement: {
                        if progress != nil && progress! > 0 {
                            if progress == 1 {
                                progress = nil
                            } else {
                                progress! -= 1
                            }
                        }
                    }
                )
            }
            .onChange(of: progress) {
                if status == .planning || mediaList == nil {
                    onUpdatedFromPlanning()
                }
                if let maxProgress = mediaDetails?.maxEpOrCh,
                   (progress ?? 0) >= maxProgress
                {
                    onMaxProgressReached()
                }
            }
            if mediaDetails?.type == .manga {
                HStack {
                    TextField("0", value: $progressVolumes, formatter: NumberFormatter())
                        .keyboardType(.numberPad)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .frame(width: textFieldWidth)
                        .onChange(of: progressVolumes) {
                            if let max = mediaDetails?.volumes, (progressVolumes ?? 0) > max {
                                progressVolumes = max
                            }
                        }
                    Stepper(
                        "Volumes",
                        onIncrement: {
                            let maxValue = mediaDetails?.volumes
                            if maxValue == nil || (progressVolumes ?? 0) < maxValue! {
                                if progressVolumes == nil {
                                    progressVolumes = 1
                                } else {
                                    progressVolumes! += 1
                                }
                            }
                        },
                        onDecrement: {
                            if progressVolumes != nil && progressVolumes! > 0 {
                                if progressVolumes == 1 {
                                    progressVolumes = nil
                                } else {
                                    progressVolumes! -= 1
                                }
                            }
                        }
                    )
                }
                .onChange(of: progressVolumes) {
                    if status == .planning || mediaList == nil {
                        onUpdatedFromPlanning()
                    }
                    if let maxVolumes = mediaDetails?.volumes,
                       (progressVolumes ?? 0) >= maxVolumes
                    {
                        onMaxProgressReached()
                    }
                }
            }
        }

        Section {
            HStack {
                TextField("0", value: $repeatCount, formatter: NumberFormatter())
                    .keyboardType(.numberPad)
                    .textFieldStyle(.roundedBorder)
                    .frame(width: textFieldWidth)
                Stepper(
                    "Repeat Count",
                    onIncrement: {
                        if repeatCount == nil {
                            repeatCount = 1
                        } else {
                            repeatCount! += 1
                        }
                    },
                    onDecrement: {
                        if repeatCount != nil && repeatCount! > 0 {
                            if repeatCount == 1 {
                                repeatCount = nil
                            } else {
                                repeatCount! -= 1
                            }
                        }
                    }
                )
            }
        }
    }
    
    @ToolbarContentBuilder
    private var toolbarContent: some ToolbarContent {
        ToolbarItem(placement: .navigationBarLeading) {
            if #available(iOS 26, *) {
                Button(action: { dismiss() }) {
                    Label("Cancel", systemImage: "xmark")
                }
                .tint(nil)
            } else {
                Button("Cancel") {
                    dismiss()
                }
            }
        }

        ToolbarItem(placement: .navigationBarTrailing) {
            if viewModel.isLoading {
                ProgressView()
            } else {
                let action: () -> Void = {
                    Task {
                        await viewModel.updateEntry(
                            mediaId: mediaDetails!.id,
                            status: status,
                            score: viewModel.score,
                            advancedScoresDict: advancedScores,
                            progress: progress,
                            progressVolumes: progressVolumes,
                            startedAt: isStartDateSet ? startDate : nil,
                            completedAt: isFinishDateSet ? finishDate : nil,
                            repeatCount: repeatCount,
                            isPrivate: isPrivate,
                            isHiddenFromStatusLists: isHiddenFromStatusLists,
                            customLists: customLists,
                            notes: notes
                        )
                    }
                }
                if #available(iOS 26, *) {
                    Button(action: action) {
                        Label("Save", systemImage: "checkmark")
                    }
                    .buttonStyle(.borderedProminent)
                } else {
                    Button("Save", action: action)
                        .font(.bold(.body)())
                }
            }
        }
    }
    
    @ViewBuilder
    private var advancedScoresView: some View {
        ForEach(advancedScores.keys.sorted(), id: \.self) { name in
            Section {
                let value = Binding(
                    get: { advancedScores[name] ?? 0 },
                    set: { advancedScores[name] = $0 }
                )
                
                HStack {
                    TextField("", value: value, formatter: decimalFormatter)
                        .keyboardType(.decimalPad)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .frame(width: textFieldWidth)
                    
                    Stepper("/\(viewModel.scoreHint)",
                            value: value,
                            in: 0...viewModel.scoreMax,
                            step: viewModel.scoreStep
                    )
                }
            } header: {
                Text(name)
            }
        }
    }
    
    private func onMaxProgressReached() {
        status = .completed
        if !isFinishDateSet {
            finishDate = .now
            isFinishDateSet = true
        }
    }
    
    private func onUpdatedFromPlanning() {
        status = .current
        if !isStartDateSet {
            startDate = .now
            isStartDateSet = true
        }
    }

    private func setValues() {
        viewModel.entry = self.mediaList
        self.status = self.mediaList?.status?.value ?? .planning
        self.progress = self.mediaList?.progress.greaterThanZeroOrNil()
        self.progressVolumes = self.mediaList?.progressVolumes.greaterThanZeroOrNil()
        self.repeatCount = self.mediaList?.repeat.greaterThanZeroOrNil()
        viewModel.score = self.mediaList?.score.greaterThanZeroOrNil()
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

        self.isPrivate = self.mediaList?.private ?? false
        self.isHiddenFromStatusLists = self.mediaList?.hiddenFromStatusLists ?? false
        self.notes = self.mediaList?.notes ?? ""
        self.advancedScores = self.mediaList?.advancedScoresDict ?? [:]
        if let customListsDict = self.mediaList?.customListsDict {
            self.customLists = customListsDict
        } else { // new entry, use custom list from settings
            UserDefaults.standard.stringArray(
                forKey: mediaDetails!.type!.value!.customListsKey
            )?.forEach { name in
                self.customLists[name] = false
            }
        }
    }
}

#Preview {
    MediaListEditView(mediaDetails: nil)
// swiftlint:disable:next file_length
}
