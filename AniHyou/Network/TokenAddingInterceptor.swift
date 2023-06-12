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
    
    static var token = KeychainSwift().get(USER_TOKEN_KEY)
    
    func interceptAsync<Operation: GraphQLOperation>(
        chain: RequestChain,
        request: HTTPRequest<Operation>,
        response: HTTPResponse<Operation>?,
        completion: @escaping (Result<GraphQLResult<Operation.Data>, Error>) -> Void) {

            if let token = TokenAddingInterceptor.token {
                request.addHeader(name: "Authorization", value: "Bearer \(token)")
            }
            
            chain.proceedAsync(request: request, response: response, completion: completion)
    }
}
