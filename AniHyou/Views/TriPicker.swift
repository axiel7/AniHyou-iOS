//
//  TriPicker.swift
//  AniHyou
//
//  Created by Axel Lopez on 29/10/2023.
//

import SwiftUI

// swiftlint:disable syntactic_sugar
struct TriPicker: View {
    
    let label: LocalizedStringKey
    let selection: Binding<Bool?>
    
    init(_ label: LocalizedStringKey, selection: Binding<Bool?>) {
        self.label = label
        self.selection = selection
    }
    
    var body: some View {
        Picker(label, selection: selection) {
            Text("None").tag(Optional<Bool>(nil))
            Text("Yes").tag(Optional(true))
            Text("No").tag(Optional(false))
        }
    }
}
// swiftlint:enable syntactic_sugar

#Preview {
    TriPicker("On my list", selection: .constant(true))
}
