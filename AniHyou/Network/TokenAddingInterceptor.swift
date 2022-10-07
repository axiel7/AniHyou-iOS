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

class TokenAddingInterceptor: ApolloInterceptor {
    func interceptAsync<Operation: GraphQLOperation>(
        chain: RequestChain,
        request: HTTPRequest<Operation>,
        response: HTTPResponse<Operation>?,
        completion: @escaping (Result<GraphQLResult<Operation.Data>, Error>) -> Void) {

            if let token = KeychainSwift().get(USER_TOKEN_KEY) {
                request.addHeader(name: "Authorization", value: "Bearer \(token)")
            }
            
            chain.proceedAsync(request: request, response: response, completion: completion)
    }
}
