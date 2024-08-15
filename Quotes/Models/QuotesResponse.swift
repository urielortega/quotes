//
//  QuotesResponse.swift
//  Quotes
//
//  Created by Uriel Ortega on 14/08/24.
//

import Foundation

// Struct that represents the entire response from the API.
struct QuotesResponse: Decodable {
    let quotes: [Quote]
    let total: Int
    let skip: Int
    let limit: Int
    
    // NOTE: CodingKeys are not required, since the keys in the JSON match exactly with the property names.
}
