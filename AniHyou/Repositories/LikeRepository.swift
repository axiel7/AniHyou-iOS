//
//  LikeRepository.swift
//  AniHyou
//
//  Created by Axel Lopez on 18/10/2023.
//

import Foundation
import AniListAPI

struct LikeRepository {
    
    static func toggleLike(
        likeableId: Int32,
        likeableType: LikeableType
    ) async -> Bool? {
        await withUnsafeContinuation { continuation in
            Network.shared.apollo.perform(
                mutation: ToggleLikeMutation(
                    likeableId: .some(likeableId),
                    type: .some(.case(likeableType))
                )
            ) { result in
                switch result {
                case .success(let graphQLResult):
                    if let data = graphQLResult.data?.toggleLikeV2 {
                        let isLiked = data.asListActivity?.isLiked ?? data.asTextActivity?.isLiked
                        ?? data.asMessageActivity?.isLiked ?? data.asActivityReply?.isLiked
                        ?? data.asThread?.isLiked ?? data.asThreadComment?.isLiked
                        //TODO: update cache
                        continuation.resume(returning: isLiked)
                    } else {
                        continuation.resume(returning: nil)
                    }
                case .failure(let error):
                    print(error)
                    continuation.resume(returning: nil)
                }
            }
        }
    }
}
