//
//  Network.swift
//  AniHyou
//
//  Created by Axel Lopez on 9/6/22.
//

import Foundation
import Apollo

class Network {
    static let shared = Network()
    private let malClientId = Bundle.main.object(forInfoDictionaryKey: "MAL_CLIENT_ID") as? String ?? ""

    private(set) lazy var apollo: ApolloClient = {
        let client = URLSessionClient()
        let store = ApolloStore(cache: InMemoryNormalizedCache())
        let provider = NetworkInterceptorProvider(client: client, store: store)
        let transport = RequestChainNetworkTransport(
            interceptorProvider: provider,
            endpointURL: URL(string: ANILIST_GRAPHQL)!
        )
        let apolloClient = ApolloClient(networkTransport: transport, store: store)
        return apolloClient
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
