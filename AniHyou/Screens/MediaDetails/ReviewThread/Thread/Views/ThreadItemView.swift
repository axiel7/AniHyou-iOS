//
//  ThreadItemView.swift
//  AniHyou
//
//  Created by Axel Lopez on 6/8/22.
//

import SwiftUI
import AniListAPI

struct ThreadItemView: View {

    var thread: MediaThreadsQuery.Data.Page.Thread

    var body: some View {
        VStack {
            Text(thread.title ?? "")
                .italic()
                .bold()
                .lineLimit(3)
                .multilineTextAlignment(.center)
                .padding()
                .foregroundColor(.primary)
            Spacer()
            HStack {
                Label("\(thread.replyCount ?? 0)", systemImage: "bubble.left")
                    .foregroundColor(.primary)
                Label("\(thread.viewCount ?? 0)", systemImage: "eye")
                    .foregroundColor(.primary)
                Spacer()
                Text(thread.user?.name ?? "")
                    .lineLimit(1)
                    .foregroundColor(.primary)
            }
            .padding(.leading, 20)
            .padding(.trailing, 20)
            .padding(.bottom)
        }
        .frame(width: 300, height: 150)
        .background(.regularMaterial)
        .clipShape(RoundedRectangle(cornerRadius: 8))
    }
}

struct ThreadItemView_Previews: PreviewProvider {
    static var previews: some View {
        ThreadItemView(thread: .init(_fieldData: nil))
    }
}
