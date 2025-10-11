//
//  ListHeader.swift
//  AniHyou
//
//  Created by Axel Lopez on 11/10/25.
//

import SwiftUI

struct ListHeader<Content: View>: View {
    
    let title: String?
    let titleLocalized: LocalizedStringKey?
    @ViewBuilder
    let destination: () -> Content
    
    init(_ title: String, destination: @escaping () -> Content) {
        self.title = title
        self.titleLocalized = nil
        self.destination = destination
    }
    
    init(_ key: LocalizedStringKey, destination: @escaping () -> Content) {
        self.title = nil
        self.titleLocalized = key
        self.destination = destination
    }
    
    var body: some View {
        NavigationLink(destination: destination) {
            HStack(alignment: .center) {
                if let title {
                    Text(title)
                        .font(.title2)
                } else if let titleLocalized {
                    Text(titleLocalized)
                        .font(.title2)
                }
                Image(systemName: "chevron.right")
                    .foregroundStyle(.secondary)
                Spacer()
            }
            .bold()
            .contentShape(.rect)
        }
        .buttonStyle(.plain)
        .padding(.horizontal)
        .padding(.top, 8)
    }
}

#Preview {
    NavigationStack {
        ListHeader("Airing Next", destination: { Text("") })
    }
}
