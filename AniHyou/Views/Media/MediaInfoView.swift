//
//  MediaInfoView.swift
//  AniHyou
//
//  Created by Axel Lopez on 24/6/22.
//

import SwiftUI

struct MediaInfoView: View {
    
    var name: String
    var value: String?
    var isExpandable: Bool = false
    @State private var isExpanded: Bool = false
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text(name)
                    .font(.subheadline)
                    .foregroundColor(.gray)
                Spacer()
                if !isExpanded {
                    Text(value ?? "Unknown")
                        .font(.subheadline)
                        .lineLimit(1)
                        .frame(width: 150, alignment: .trailing)
                }
                if isExpandable {
                    Image(systemName: isExpanded ? "chevron.up" : "chevron.down")
                        .foregroundColor(.gray)
                }
            }
            if isExpanded {
                Text(value ?? "Unknown")
                    .font(.subheadline)
                    .multilineTextAlignment(.leading)
                    .padding(.top, 1)
            }
            Divider()
        }
        .onTapGesture {
            if isExpandable {
                withAnimation {
                    isExpanded.toggle()
                }
            }
        }
        .padding(.leading)
        .padding(.trailing)
        .padding(.top, 7)
    }
}

struct MediaInfoView_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            MediaInfoView(name: "Start date", value: "12-12-2012")
            MediaInfoView(name: "Genres", value: "Action, Comedy, Slice of Life, Supernatural", isExpandable: true)
        }
    }
}
