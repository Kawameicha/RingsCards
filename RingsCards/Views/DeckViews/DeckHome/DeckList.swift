//
//  DeckList.swift
//  RingsCards
//
//  Created by Christoph Freier on 28.08.23.
//

import SwiftUI
import SwiftData

struct DeckList: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var decks: [Deck]
    @State private var searchText: String = ""

    var filteredDecks: [Deck] {
        guard !searchText.isEmpty else { return decks }
        return decks.filter { deck in
            deck.name.lowercased().cleaned().contains(searchText.lowercased())
        }
    }

    var body: some View {
        NavigationView {
            List {
                if decks.isEmpty {
                    NavigationLink(destination: DeckNew(),
                                   label: { Text("Create a Deck") })
                } else {
                    ForEach(filteredDecks) { deck in
                        NavigationLink {
                            DeckView(deck: deck)
                        } label: {
                            DeckRow(deck: deck)
                        }
                    }
                    .onDelete(perform: deleteItems)
                }
            }
            .listStyle(.sidebar)
            .navigationTitle("My Decks")
            .searchable(text: $searchText)
            .toolbar {
                ToolbarItem {
                    NavigationLink(destination: DeckNew(),
                                   label: { Image(systemName: "plus") })
                }
            }
        }
    }

    func deleteItems(offsets: IndexSet) {
            for index in offsets {
                modelContext.delete(decks[index])
        }
    }
}

#Preview {
        DeckList()
            .modelContainer(for: Deck.self, inMemory: true)
}
