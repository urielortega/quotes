//
//  Quote.swift
//  Quotes
//
//  Created by Uriel Ortega on 14/08/24.
//

import Foundation

struct Quote: Identifiable {
    let id: Int
    let text: String
    let author: String
}

extension Quote: Decodable {
    /// Enum used to map the JSON keys to the properties of the Quote struct during decoding. Each case corresponds to a property in Quote.
    private enum CodingKeys: String, CodingKey {
        case id
        case text = "quote" // In the JSON, the quote text is represented by the key "quote".
        case author
    }
    
    /*
    /// Custom initializer with data validation that tells the Quote struct how to decode itself from a JSON object.
    init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self) // The container is like a dictionary that holds all the JSON key-value pairs.
        
        // Each property is decoded from the container using the decode method, which extracts the value associated with a given key.
        let rawId = try? container.decode(Int.self, forKey: .id)
        let rawText = try? container.decode(String.self, forKey: .text)
        let rawAuthor = try? container.decode(String.self, forKey: .author)

        // The guard statement ensures that all the values are non-nil.
        guard let id = rawId,
              let text = rawText,
              let author = rawAuthor
        else {
            throw QuoteError.missingData
        }

        // The decoded and validated values are assigned to the corresponding properties of the Quote struct.
        self.id = id
        self.text = text
        self.author = author
    }
     */
}
