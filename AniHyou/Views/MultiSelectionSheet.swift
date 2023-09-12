//
//  MultiSelectionSheet.swift
//  AniHyou
//
//  Created by Axel Lopez on 07/07/2023.
//

import SwiftUI
import AniListAPI

struct MultiSelectionSheet<Data: Hashable, RowContent: View>: View {

    let values: [Data]
    let selectedValues: Binding<Set<Data>>

    let onDone: () -> Void
    @ViewBuilder let rowContent: (Data) -> RowContent

    @Environment(\.dismiss) private var dismiss

    var body: some View {
        NavigationStack {
            List(values, id: \.self, selection: selectedValues, rowContent: rowContent)
                .environment(\.editMode, .constant(.active))
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        Button("Clear", role: .destructive) {
                            selectedValues.wrappedValue.removeAll()
                        }
                        .tint(.red)
                    }
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button(
                            action: {
                                onDone()
                                dismiss()
                            },
                            label: {
                                Text("Done").bold()
                            }
                        )
                    }
                }
        }
    }
}

struct MultiSelectionSheet_Previews: PreviewProvider {
    static var previews: some View {
        MultiSelectionSheet(
            values: MediaFormat.allCases,
            selectedValues: .constant(Set()),
            onDone: {},
            rowContent: { value in
                Text(value.localizedName)
            }
        )
    }
}
