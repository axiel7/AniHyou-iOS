//
//  ThreadComment.swift
//  AniHyou
//
//  Created by Axel Lopez on 26/03/2024.
//

import AniListAPI

extension ChildCommentsQuery.Data.Page.ThreadComment {
    var childCommentsParsed: [ChildCommentsQuery.Data.Page.ThreadComment]? {
        return childComments?.toThreadComments()
    }
}

extension CustomJSON {
    func toThreadComments() -> [ChildCommentsQuery.Data.Page.ThreadComment]? {
        switch self {
        case .dictionary(let dictionary):
            return try? [ChildCommentsQuery.Data.Page.ThreadComment(data: dictionary)]
        case .array(let array):
            return array.compactMap {
                try? ChildCommentsQuery.Data.Page.ThreadComment(data: $0)
            }
        }
    }
}
