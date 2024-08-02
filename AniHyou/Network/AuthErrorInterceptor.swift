//
//  AuthErrorInterceptor.swift
//  AniHyou
//
//  Created by Axel Lopez on 02/08/2024.
//

import Foundation
import Apollo
import ApolloAPI

class AuthErrorInterceptor: ApolloErrorInterceptor {
    func handleErrorAsync<Operation>(
        error: any Error,
        chain: any Apollo.RequestChain,
        request: Apollo.HTTPRequest<Operation>,
        response: Apollo.HTTPResponse<Operation>?,
        completion: @escaping (Result<Apollo.GraphQLResult<Operation.Data>, any Error>) -> Void
    ) where Operation: GraphQLOperation {
        if let data = response?.rawData,
           let errorResponse = try? JSONDecoder().decode(ErrorResponse.self, from: data)
        {
            if errorResponse.errors.contains(where: { $0.message == "Invalid token" }) {
                LoginRepository.onTokenExpired()
            }
        }
        completion(.failure(error))
    }
}
