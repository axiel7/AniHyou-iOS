//
//  DonationsViewModel.swift
//  AniHyou
//
//  Created by Axel Lopez on 18/07/2023.
//

import Foundation
import StoreKit

@MainActor
@Observable class DonationsViewModel {

    var transacitonListener: Task<Void, Error>?

    private var productIDs = ["first_tier_donation", "second_tier_donation", "third_tier_donation"]

    var products = [Product]()

    init() {
        transacitonListener = listenForTransactions()
        Task { @MainActor in
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
        Task(priority: .background) {
            for await result in Transaction.updates {
                switch result {
                case let.verified(transaction):
                    guard
                        products.first(where: { $0.id == transaction.productID }) != nil
                    else {
                        continue
                    }
                    if transaction.revocationDate != nil {
                         onProductPurchased(false)
                    } else if let expirationDate = transaction.expirationDate,
                        expirationDate < Date() {
                        continue
                    } else if transaction.isUpgraded {
                        continue
                    } else {
                        onProductPurchased(true)
                    }
                    await transaction.finish()
                case .unverified:
                    onProductPurchased(false)
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
