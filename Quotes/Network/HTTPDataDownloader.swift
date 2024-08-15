//
//  HTTPDataDownloader.swift
//  Quotes
//
//  Created by Uriel Ortega on 14/08/24.
//

import Foundation

let validStatus = 200...299 // Codes in the range 200–299 indicate successful requests.

/// A protocol for downloading data from a URL.
protocol HTTPDataDownloader {
    /// Downloads data from a given URL.
    /// - Parameter from: The URL to download data from.
    /// - Returns: The downloaded data.
    func httpData(from: URL) async throws -> Data
}

extension URLSession: HTTPDataDownloader {
    func httpData(from url: URL) async throws -> Data {
        guard let (data, response) = try await self.data(
            from: url,
            delegate: nil
        // After successfully unwrapping data and response, check whether the statusCode is within the valid range.
        ) as? (Data, HTTPURLResponse), validStatus.contains(response.statusCode) else {
            throw QuoteError.networkError
        }
        
        return data
    }
}
