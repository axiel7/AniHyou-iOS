//
//  Network.swift
//  AniHyou
//
//  Created by Axel Lopez on 9/6/22.
//

import Foundation
import Apollo

final class Network: Sendable {
    static let shared = Network()
    private let malClientId = Bundle.main.object(forInfoDictionaryKey: "MAL_CLIENT_ID") as? String ?? ""

    let apollo: ApolloClient = {
        let store = ApolloStore(cache: InMemoryNormalizedCache())
        let provider = NetworkInterceptorProvider()
        let transport = RequestChainNetworkTransport(
            urlSession: URLSession.shared,
            interceptorProvider: provider,
            store: store,
            endpointURL: URL(string: ANILIST_GRAPHQL)!
        )
        return ApolloClient(networkTransport: transport, store: store)
    }()
    
    private func buildMalGetURLRequest(_ url: URL) -> URLRequest {
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue(malClientId, forHTTPHeaderField: "X-MAL-CLIENT-ID")
        return request
    }
    
    func getMalRequest<T: Decodable>(for url: URL) async -> T? {
        do {
            let (data, _) = try await URLSession.shared.data(for: buildMalGetURLRequest(url))
            return try JSONDecoder().decode(T.self, from: data)
        } catch {
            print(error)
            return nil
        }
    }
}
