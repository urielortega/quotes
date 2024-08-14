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
        }
    }
}
