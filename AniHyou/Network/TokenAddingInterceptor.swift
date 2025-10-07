//
//  TokenAddingInterceptor.swift
//  AniHyou
//
//  Created by Axel Lopez on 10/6/22.
//

import Foundation
import Apollo
import ApolloAPI
import KeychainSwift

final class TokenAddingInterceptor: HTTPInterceptor {
    func intercept(
        request: URLRequest,
        next: @Sendable (URLRequest) async throws -> Apollo.HTTPResponse
    ) async throws -> Apollo.HTTPResponse {
        var newRequest = request
        if let token = KeychainUtils.shared.keychain.get(USER_TOKEN_KEY) {
            newRequest.addValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        }
        
        return try await next(newRequest).mapChunks { (_, chunk) in return chunk }
    }
}
