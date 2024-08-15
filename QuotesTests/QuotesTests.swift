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
    
    func testJSONDecoderDecodesQuotesResponse() throws {
        let decoder = JSONDecoder()
        
        // The decoder checks that the types in the JSON match the types expected by the QuotesResponse struct. If any required fields are missing or of the wrong type, the decoder throws an error:
        let decoded = try decoder.decode(QuotesResponse.self, from: testQuotesData)

        XCTAssertEqual(decoded.quotes.count, 3)
        XCTAssertEqual(decoded.quotes[1].author, "Abdul Kalam")
        
        // Metadata asserts:
        XCTAssertEqual(decoded.total, 1454)
        XCTAssertEqual(decoded.skip, 0)
        XCTAssertEqual(decoded.limit, 30)
    }
    
    func testClientDoesFetchQuoteData() async throws {
        let downloader = TestDownloader()
        let client = QuoteClient(downloader: downloader)
        let quotes = try await client.quotes
        
        XCTAssertEqual(quotes.count, 3)
    }
}
