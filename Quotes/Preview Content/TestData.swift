//
//  TestData.swift
//  Quotes
//
//  Created by Uriel Ortega on 14/08/24.
//

import Foundation

let testQuote: Data = """
    {
      "id": 7,
      "quote": "If You Are Out To Describe The Truth, Leave Elegance To The Tailor.",
      "author": "Albert Einstein"
    }
    """.data(using: .utf8)!

let testQuotesData: Data = """
    {
      "quotes": [
        {
          "id": 1,
          "quote": "Your heart is the size of an ocean. Go find yourself in its hidden depths.",
          "author": "Rumi"
        },
        {
          "id": 2,
          "quote": "The Bay of Bengal is hit frequently by cyclones. The months of November and May, in particular, are dangerous in this regard.",
          "author": "Abdul Kalam"
        },
        {
          "id": 3,
          "quote": "Thinking is the capital, Enterprise is the way, Hard Work is the solution.",
          "author": "Abdul Kalam"
        }
      ],
      "total": 1454,
      "skip": 0,
      "limit": 30
    }
    """.data(using: .utf8)!
