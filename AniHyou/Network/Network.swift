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
    
    private(set) lazy var apollo: ApolloClient = {
        let client = URLSessionClient()
        let store = ApolloStore(cache: InMemoryNormalizedCache())
        let provider = NetworkInterceptorProvider(client: client, store: store)
        let transport = RequestChainNetworkTransport(interceptorProvider: provider, endpointURL: URL(string: ANILIST_GRAPHQL)!)
        let apolloClient = ApolloClient(networkTransport: transport, store: store)
        return apolloClient
    }()
}
