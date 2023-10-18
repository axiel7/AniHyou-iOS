//
//  LikeRepository.swift
//  AniHyou
//
//  Created by Axel Lopez on 18/10/2023.
//

import Foundation
import AniListAPI

class LikeRepository {
    
    static func toggleLike(
        likeableId: Int,
        likeableType: LikeableType
    ) async -> Bool? {
        await withCheckedContinuation { continuation in
            Network.shared.apollo.perform(
                mutation: ToggleLikeMutation(
                    likeableId: .some(likeableId),
                    type: .some(.case(likeableType))
                )
            ) { result in
                switch result {
                case .success(let graphQLResult):
                    if let data = graphQLResult.data?.toggleLikeV2 {
                        let isLiked = (data.asListActivity?.isLiked ?? data.asTextActivity?.isLiked)
                        ?? (data.asMessageActivity?.isLiked ?? data.asActivityReply?.isLiked)
                        ?? (data.asThread?.isLiked ?? data.asThreadComment?.isLiked)
                        //TODO: update cache
                        continuation.resume(returning: isLiked)
                    }
                case .failure(let error):
                    print(error)
                    continuation.resume(returning: nil)
                }
            }
        }
    }
}
