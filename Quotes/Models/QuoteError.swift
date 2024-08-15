//
//  QuoteError.swift
//  Quotes
//
//  Created by Uriel Ortega on 14/08/24.
//

import Foundation

enum QuoteError: Error {
    case missingData
    case networkError
    case dataDecodingError
    case unexpectedError(error: Error)
}

extension QuoteError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .missingData:
            return NSLocalizedString("Found and will discard a quote missing a valid id, text, or author.", comment: "")
        case .networkError:
            return NSLocalizedString("Error fetching quote data over the network.", comment: "")
        case .unexpectedError(let error):
            return NSLocalizedString("Received unexpected error. \(error.localizedDescription)", comment: "")
        case .dataDecodingError:
            return NSLocalizedString("Failed to decode the data. The data may be corrupted or in an unexpected format.", comment: "")
        }
    }
}
