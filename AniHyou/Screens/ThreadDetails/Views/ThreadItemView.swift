//
//  ThreadItemView.swift
//  AniHyou
//
//  Created by Axel Lopez on 6/8/22.
//

import SwiftUI
import AniListAPI

struct ThreadItemView: View {

    let thread: BasicThreadDetails

    var body: some View {
        VStack {
            Text(thread.title ?? "")
                .italic()
                .bold()
                .lineLimit(3)
                .multilineTextAlignment(.center)
                .padding()
                .foregroundStyle(.primary)
            Spacer()
            HStack {
                Label("\(thread.replyCount ?? 0)", systemImage: "bubble.left")
                    .foregroundStyle(.primary)
                Label("\(thread.viewCount ?? 0)", systemImage: "eye")
                    .foregroundStyle(.primary)
                Spacer()
                Text(thread.user?.name ?? "")
                    .lineLimit(1)
                    .foregroundStyle(.primary)
            }
            .padding(.leading, 20)
            .padding(.trailing, 20)
            .padding(.bottom)
        }
        .frame(width: 300, height: 150)
        .background(.regularMaterial)
        .clipShape(RoundedRectangle(cornerRadius: 8, style: .continuous))
    }
}

#Preview {
    ThreadItemView(thread: .init(_fieldData: nil))
}
