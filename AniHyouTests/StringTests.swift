//
//  StringTests.swift
//  AniHyouTests
//
//  Created by Axel Lopez on 18/04/2024.
//

import XCTest
@testable import AniHyou

final class StringTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testHtmlStrip() throws {
        let html = "<p>This is a test</p>"
        let stripped = html.htmlStripped
        XCTAssertEqual(stripped, "This is a test")
    }

}
