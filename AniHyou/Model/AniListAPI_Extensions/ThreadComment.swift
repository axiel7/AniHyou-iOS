//
//  ThreadComment.swift
//  AniHyou
//
//  Created by Axel Lopez on 26/03/2024.
//

import AniListAPI

extension CustomJSON {
    func toThreadComments() async -> [ChildCommentsQuery.Data.Page.ThreadComment]? {
        switch self {
        case .dictionary(let dictionary):
            try? await [ChildCommentsQuery.Data.Page.ThreadComment(data: dictionary)]
        case .array(let array):
            await array.asyncCompactMap {
                try? await ChildCommentsQuery.Data.Page.ThreadComment(data: $0)
            }
        }
    }
}
