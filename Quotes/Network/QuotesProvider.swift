//
//  QuotesProvider.swift
//  Quotes
//
//  Created by Uriel Ortega on 15/08/24.
//

import Foundation

/// ObservableObject that manages the fetching and deletion of quotes. 
/// 
/// It acts as a view model that interacts with the QuoteClient to fetch data and keeps track of the current list of quotes.
@MainActor
class QuotesProvider: ObservableObject {
    /// Quotes currently fetched and available.
    @Published var quotes: [Quote] = []
    
    /// Client responsible for fetching quotes from the remote API.
    let client: QuoteClient
    
    /// Fetches the latest quotes from the remote API using the QuoteClient. The fetched quotes are stored in the `quotes` property.
    func fetchQuotes() async throws {
        let latestQuotes = try await client.quotes
        self.quotes = latestQuotes
    }
    
    /// Deletes quotes at the specified offsets from the list.
    func deleteQuotes(atOffsets offsets: IndexSet) {
        quotes.remove(atOffsets: offsets)
    }
    
    /// Initializes a new QuotesProvider instance with an optional custom QuoteClient. If no client is provided, the default is to use a new instance of QuoteClient.
    init(client: QuoteClient = QuoteClient()) {
        self.client = client
    }
}
