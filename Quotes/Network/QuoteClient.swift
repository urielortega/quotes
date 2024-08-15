//
//  QuoteClient.swift
//  Quotes
//
//  Created by Uriel Ortega on 14/08/24.
//

import Foundation

/// A client responsible for fetching quotes from a remote API.
///
/// `QuoteClient` handles the network requests to retrieve data from the remote API and decodes the JSON response into `Quote` models.
///
/// - Note: The client uses dependency injection to allow for easy testing and customization of the network layer.
class QuoteClient {
    private let feedURL = URL(string: "https://dummyjson.com/quotes")!
    
    private lazy var decoder: JSONDecoder = {
        let aDecoder = JSONDecoder()
        return aDecoder
    }()
    
    private let downloader: any HTTPDataDownloader  // QuoteClient is DEPENDENT on something that conforms to HTTPDataDownloader. (Dependency Injection)
    
    init(downloader: any HTTPDataDownloader = URLSession.shared) { // The downloader defaults to URLSession.shared.
        self.downloader = downloader
    }
    
    var quotes: [Quote] {
        get async throws {
            do {
                let data = try await downloader.httpData(from: feedURL)
                let allQuotes = try decoder.decode(QuotesResponse.self, from: data)
                
                return allQuotes.quotes
            } catch {
                throw QuoteError.dataDecodingError
            }
        }
    }
}
