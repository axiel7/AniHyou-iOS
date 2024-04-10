//
//  DonationsViewModel.swift
//  AniHyou
//
//  Created by Axel Lopez on 18/07/2023.
//

import Foundation
import StoreKit

@MainActor
class DonationsViewModel: ObservableObject {

    var transacitonListener: Task<Void, Error>?

    private var productIDs = ["first_tier_donation", "second_tier_donation", "third_tier_donation"]

    @Published var products = [Product]()

    init() {
        transacitonListener = listenForTransactions()
        Task {
            await requestProducts()
        }
    }

    func requestProducts() async {
        do {
            products = try await Product.products(for: productIDs)
                .sorted(by: { product1, product2 in product1.price < product2.price })
        } catch {
            print(error)
        }
    }

    func purchase(_ product: Product) async throws -> Transaction? {
        let result = try await product.purchase()
        switch result {
        case .success(.verified(let transaction)):
            await transaction.finish()
            onProductPurchased(true)
            return transaction
        case .userCancelled:
            onProductPurchased(false)
            return nil
        default:
            return nil
        }
    }

    func onProductPurchased(_ isSuccess: Bool) {
        UserDefaults(suiteName: ANIHYOU_GROUP)?.set(isSuccess, forKey: HAS_DONATED_KEY)
    }

    func listenForTransactions() -> Task<Void, Error> {
        Task.detached {
            for await result in Transaction.updates {
                switch result {
                case let.verified(transaction):
                    guard
                        await self.products.first(where: { $0.id == transaction.productID }) != nil
                    else {
                        continue
                    }
                    await transaction.finish()
                case .unverified:
                    await self.onProductPurchased(false)
                    continue
                }
            }
        }
   }
}

extension Product {
    var emoji: String {
        if id.starts(with: "first") {
            "😀"
        } else if id.starts(with: "second") {
            "😁"
        } else if id.starts(with: "third") {
            "🤩"
        } else {
            ""
        }
    }
}
