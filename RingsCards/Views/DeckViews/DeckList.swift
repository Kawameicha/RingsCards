//
//  DeckList.swift
//  RingsCards
//
//  Created by Christoph Freier on 28.08.23.
//

import SwiftUI

struct DeckList: View {
    @EnvironmentObject var ringsData: RingsData
    @State private var searchText: String = ""
    @State private var publicDeckOnly = false

    var publicOnly: [Deck] {
        guard !publicDeckOnly == false else { return ringsData.decks }
        return ringsData.decks.filter { deck in
                deck.is_published == true
        }
    }

    var filteredDecks: [Deck] {
        guard !searchText.isEmpty else { return publicOnly }
        return publicOnly.filter { deck in
            deck.name.lowercased().cleaned().contains(searchText.lowercased())
        }
    }

    var body: some View {
        NavigationView {
            List(filteredDecks) { deck in
                NavigationLink {
                    DeckView(deck: deck)
                } label: {
                    DeckRow(deck: deck)
                }
            }
            .listStyle(.sidebar)
            .navigationTitle("My Decks")
            .searchable(text: $searchText)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Menu(content: {
                        Button(action: {publicDeckOnly.toggle()}) {
                            Label("Published Only",
                                  systemImage: publicDeckOnly ? "line.3.horizontal.decrease.circle.fill" : "line.3.horizontal.decrease.circle")
                        }
                    }) {
                        Image(systemName: "ellipsis.circle")
                    }
                }
            }
        }
    }
}

struct DeckList_Previews: PreviewProvider {
    static var previews: some View {
        DeckList()
            .environmentObject(RingsData())
    }
}
