//
//  TriPicker.swift
//  AniHyou
//
//  Created by Axel Lopez on 29/10/2023.
//

import SwiftUI

struct TriPicker: View {
    
    let label: LocalizedStringKey
    let selection: Binding<Bool?>
    
    init(_ label: LocalizedStringKey, selection: Binding<Bool?>) {
        self.label = label
        self.selection = selection
    }
    
    var body: some View {
        Picker(label, selection: selection) {
            // swiftlint:disable:next syntactic_sugar
            Text("None").tag(Optional<Bool>(nil))
            Text("Yes").tag(Optional(true))
            Text("No").tag(Optional(false))
        }
    }
}

#Preview {
    TriPicker("On my list", selection: .constant(true))
}
