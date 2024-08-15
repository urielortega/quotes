//
//  TestDownloader.swift
//  Quotes
//
//  Created by Uriel Ortega on 14/08/24.
//

import Foundation

class TestDownloader: HTTPDataDownloader {
    func httpData(from url: URL) async throws -> Data { // Ignores the 'url' property...
        try await Task.sleep(nanoseconds: UInt64.random(in: 100_000_000...500_000_000))
        return testQuotesData // ...because it returns the 'testQuotesData' constant property.
    }
}
