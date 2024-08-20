//
//  ContentView.swift
//  Quotes
//
//  Created by Uriel Ortega on 14/08/24.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var provider: QuotesProvider
    @State var isLoading = false
    @State private var error: QuoteError?
    @State private var hasError = false
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
    }
}

#Preview {
    ContentView()
        .environmentObject(
            QuotesProvider(
                client: QuoteClient(
                    downloader: TestDownloader()
                )
            )
        )
}
