//
//  NetworkInterceptorProvider.swift
//  AniHyou
//
//  Created by Axel Lopez on 10/6/22.
//

import Foundation
import Apollo
import ApolloAPI

final class NetworkInterceptorProvider: InterceptorProvider {
    
    func httpInterceptors<Operation: GraphQLOperation>(for operation: Operation) -> [any HTTPInterceptor] {
        return DefaultInterceptorProvider.shared.httpInterceptors(for: operation) + [
          TokenAddingInterceptor()
        ]
    }
    
    func graphQLInterceptors<Operation>(
        for operation: Operation
    ) -> [any GraphQLInterceptor] where Operation: GraphQLOperation {
        return DefaultInterceptorProvider.shared.graphQLInterceptors(for: operation) + [
            AuthErrorInterceptor()
        ]
    }
}
