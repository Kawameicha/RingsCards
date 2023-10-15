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
    @Query(sort: \Deck.date_update, order: .reverse) private var decks: [Deck]
    @State private var searchText: String = ""

    var filteredDecks: [Deck] {
        guard !searchText.isEmpty else { return decks }
        return decks.filter { deck in
            deck.name.localizedStandardContains(searchText)
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
                ToolbarItem(placement: .bottomBar) {
                    Text("\(filteredDecks.count) decks")
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
        .modelContainer(previewModelContainer)
}
