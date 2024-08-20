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
        NavigationView {
            List {
                ForEach(provider.quotes) { quote in
                    VStack(alignment: .leading) {
                        Text(quote.text)
                            .padding(.bottom)
                        
                        Text(quote.author)
                            .font(.caption)
                            .foregroundStyle(.secondary)
                    }
                }
                .onDelete(perform: deleteQuotes)
            }
            .listStyle(.inset)
            .navigationTitle("Quotes")
            // .toolbar(content: toolbarContent)
            // .environment(\.editMode, $editMode)
            .refreshable {
                await fetchQuotes()
            }
            .alert(isPresented: $hasError, error: error) {}
        }
        .task {
            await fetchQuotes()
        }
    }
}

extension ContentView {
    func deleteQuotes(at offsets: IndexSet) {
        provider.deleteQuotes(atOffsets: offsets)
    }
    
    func fetchQuotes() async {
        isLoading = true
        
        do {
            try await provider.fetchQuotes()
        } catch {
            self.error = error as? QuoteError ?? .unexpectedError(error: error)
            self.hasError = true
        }
        
        isLoading = false
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
