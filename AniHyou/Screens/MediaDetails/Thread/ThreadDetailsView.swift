//
//  ThreadDetailsView.swift
//  AniHyou
//
//  Created by Axel Lopez on 6/8/22.
//

import SwiftUI
import RichText

struct ThreadDetailsView: View {
    
    var thread: MediaThreadsQuery.Data.Page.Thread
    @StateObject private var viewModel = ThreadDetailsViewModel()
    
    var body: some View {
        ScrollView(.vertical) {
            LazyVStack(alignment: .leading) {
                VStack(alignment: .leading) {
                    Text(thread.title ?? "This is a very large thread title to test the lenght of this text view in SwiftUI omg this anime is amazing")
                        .bold()
                        .font(.title3)
                        .padding(.bottom, 1)
                    
                    Text(thread.createdAt.timestampToDateString())
                        .font(.footnote)
                        .foregroundColor(.gray)
                    
                    RichText(html: thread.body ?? "So this is an amazing anime\nWhat do you think about it?\nDid you like it?\nLet me know!")
                        .linkColor(light: .accentColor, dark: .accentColor)
                        .placeholder {
                            ProgressView()
                        }
                        .padding(.top)
                        .padding(.bottom)
                    
                    HStack {
                        Label("\(thread.likeCount)", systemImage: "heart")
                        Spacer()
                        Text(thread.user?.name ?? "AVeryLargeUsername")
                            .lineLimit(1)
                            .foregroundColor(.primary)
                    }
                }//:VStack
                .padding()
                
                Spacer()
            }//:LazyVStack
        }//:VScrollView
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct ThreadDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        ThreadDetailsView(thread: MediaThreadsQuery.Data.Page.Thread(id: 0, likeCount: 0, createdAt: 1659666438))
    }
}
