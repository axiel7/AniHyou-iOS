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
    @Published var message: String?
    @Published var showAlert = false

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
            message = "purchase OK"
            showAlert = true
            onProductPurchased(true)
            return transaction
        case .userCancelled:
            message = "purchase cancelled"
            showAlert = true
            onProductPurchased(false)
            return nil
        default:
            message = "unknown error \(result)"
            showAlert = true
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
                        message = "id not found for \(transaction.productID)"
                        showAlert = true
                        continue
                    }
                    if transaction.isUpgraded {
                        continue
                    } else if transaction.revocationDate != nil {
                        message = "product revocated: \(transaction.productID)"
                        showAlert = true
                        onProductPurchased(false)
                    } else if let expirationDate = transaction.expirationDate,
                        expirationDate < Date() {
                        message = "product expired: \(transaction.productID)"
                        showAlert = true
                        continue
                    } else {
                        message = "product OK, purchase saved"
                        showAlert = true
                        onProductPurchased(true)
                    }
                    await transaction.finish()
                case .unverified:
                    message = "unverified transaction: \(result.debugDescription)"
                    showAlert = true
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
