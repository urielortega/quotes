//
//  QuotesApp.swift
//  Quotes
//
//  Created by Uriel Ortega on 14/08/24.
//

import SwiftUI

@main
struct QuotesApp: App {
    @StateObject var quotesProvider = QuotesProvider()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(quotesProvider)
        }
    }
}
