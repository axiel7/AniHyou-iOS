//
//  Network.swift
//  AniHyou
//
//  Created by Axel Lopez on 9/6/22.
//

import Foundation
import Apollo
import ApolloAPI
import AniListAPI

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
            if let urlError = error as? URLError {
                handleUrlError(urlError)
            }
            return nil
        }
    }
    
    @discardableResult
    static func fetchPagedResult<Query: GraphQLQuery, Item>(
        _ query: Query,
        forceReload: Bool = false,
        extractItems: (Query.Data) -> [Item]?,
        extractPage: (Query.Data) -> CommonPage?
    ) async -> PagedResult<Item>? where Query.ResponseFormat == SingleResponseFormat {
        do {
            let result = try await Network.shared.apollo.fetch(
                query: query,
                cachePolicy: forceReload ? .networkOnly : .cacheFirst
            )
            if let data = result.data,
               let items = extractItems(data) {
                let pageInfo = extractPage(data)
                return PagedResult(
                    data: items,
                    page: Int32((pageInfo?.currentPage ?? 1) + 1),
                    hasNextPage: pageInfo?.hasNextPage == true
                )
            } else if let error = result.errorsToString() {
                DispatchQueue.main.async {
                    NotificationCenter.default.post(name: "networkError", object: error)
                }
            }
            return nil
        } catch {
            print(error)
            if !(error is CancellationError) {
                DispatchQueue.main.async {
                    NotificationCenter.default.post(name: "networkError", object: "\(error)")
                }
            }
            return nil
        }
    }
    
    private func handleUrlError(_ error: URLError) {
        var message: String?
        switch error.code {
        case .badServerResponse:
            message = "Bad server response"
        case .cannotConnectToHost, .notConnectedToInternet:
            message = "No internet connection"
        case .cannotFindHost:
            message = "Cannot find host"
        case .cannotDecodeContentData, .cannotDecodeRawData, .cannotParseResponse:
            message = "Error decoding data"
        case .resourceUnavailable:
            message = "Resource unavailable"
        case .timedOut:
            message = "Timeout"
        default:
            message = nil
        }
        if let message = message {
            DispatchQueue.main.async {
                NotificationCenter.default.post(name: "networkError", object: message)
            }
        }
    }
}

extension GraphQLError {
    func toErrorString() -> String {
        """
            \(errorDescription?.prefix(500) ?? "")
            Reason:
            \(failureReason ?? "")
            Recovery:
            \(recoverySuggestion ?? "")
            """
    }
}

extension GraphQLResponse {
    func errorsToString() -> String? {
        errors?.map({ $0.toErrorString() }).joined(separator: "\n")
    }
}
