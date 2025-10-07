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
        do {
            let result = try await Network.shared.apollo.perform(
                mutation: ToggleLikeMutation(
                    likeableId: .some(likeableId),
                    type: .some(.case(likeableType))
                )
            )
            if let data = result.data?.toggleLikeV2 {
                let isLiked = data.asListActivity?.isLiked ?? data.asTextActivity?.isLiked
                ?? data.asMessageActivity?.isLiked ?? data.asActivityReply?.isLiked
                ?? data.asThread?.isLiked ?? data.asThreadComment?.isLiked
                //TODO: update cache
                return isLiked
            }
            return nil
        } catch {
            print(error)
            return nil
        }
    }
}
