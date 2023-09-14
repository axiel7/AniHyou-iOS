//
//  DatePickerToggleView.swift
//  AniHyou
//
//  Created by Axel Lopez on 22/6/22.
//

import SwiftUI

struct DatePickerToggleView: View {

    let text: String
    let selection: Binding<Date>
    let isDateSet: Binding<Bool>
    @State private var showDatePicker = false
    @AppStorage(ACCENT_COLOR_KEY) private var accentColor = ANIHYOU_COLOR

    var body: some View {
        VStack {
            Toggle(isOn: isDateSet) {
                VStack(alignment: .leading) {
                    Text(text)
                    if isDateSet.wrappedValue {
                        Text("\(selection.wrappedValue.formatted(date: .abbreviated, time: .omitted))")
                            .font(.footnote)
                            .foregroundColor(Color(hex: accentColor))
                    }
                }
                .onTapGesture {
                    if isDateSet.wrappedValue {
                        showDatePicker.toggle()
                    }
                }
            }
            .onChange(of: isDateSet.wrappedValue) { isSet in
                showDatePicker = isSet
            }
            if showDatePicker {
                DatePicker("Start Date", selection: selection, displayedComponents: [.date])
                    .datePickerStyle(.graphical)
            }
        }
    }
}

#Preview {
    DatePickerToggleView(text: "Start Date", selection: .constant(Date()), isDateSet: .constant(true))
}
