//
//  QuotesTests.swift
//  QuotesTests
//
//  Created by Uriel Ortega on 14/08/24.
//

import XCTest
@testable import Quotes

class QuotesTests: XCTestCase {
    func testJSONDecoderDecodesQuote() throws {
        let decoder = JSONDecoder()

        // The decoder checks that the types in the JSON match the types expected by the Quote struct. If any required fields are missing or of the wrong type, the decoder throws an error:
        let quote = try decoder.decode(Quote.self, from: testQuote)

        XCTAssertEqual(quote.author, "Albert Einstein")

        let expectedText = "If You Are Out To Describe The Truth, Leave Elegance To The Tailor."

        XCTAssertEqual(quote.text, expectedText)
    }
}
