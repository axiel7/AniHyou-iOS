//
//  AniHyouTests.swift
//  AniHyouTests
//
//  Created by Axel Lopez on 18/04/2024.
//

import XCTest
@testable import AniHyou

final class UserTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testPerformanceFetchNewNotifications() throws {
        // This is an example of a performance test case.
        measure {
            let exp = expectation(description: "Finished")
            Task {
                let count = await UserRepository.fetchNewNotifications()?.count
                if let count {
                    print("Fetched \(count) new notifications")
                } else {
                    print("Error fetching new notifications")
                }
                exp.fulfill()
            }
            wait(for: [exp])
        }
    }

}
