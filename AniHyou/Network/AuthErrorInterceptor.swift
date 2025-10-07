//
//  AuthErrorInterceptor.swift
//  AniHyou
//
//  Created by Axel Lopez on 02/08/2024.
//

import Foundation
import Apollo
import ApolloAPI

final class AuthErrorInterceptor: GraphQLInterceptor {
    
    func intercept<Request: GraphQLRequest>(
      request: Request,
      next: NextInterceptorFunction<Request>
    ) async throws -> InterceptorResultStream<Request> {
        return await next(request)
          .mapErrors { error in
              if error.localizedDescription.contains("Inavlid token") {
                  Task { @MainActor in
                      LoginRepository.onTokenExpired()
                  }
              }
              throw error
          }
      }
}
