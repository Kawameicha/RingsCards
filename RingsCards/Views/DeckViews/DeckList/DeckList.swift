//
//  DeckList.swift
//  RingsCards
//
//  Created by Christoph Freier on 28.08.23.
//

import SwiftUI
import SwiftData

struct DeckList: View {
    @Environment(ViewDeckModel.self) var viewDeckModel
    @Environment(\.modelContext) var modelContext
    @Query var decks: [Deck]

    init(
        sortDeckParameter: SortDeckParameter = .name,
        sortOrder: SortOrder = .forward,
        searchText: String = ""
    ) {
        let predicate = Deck.predicate(
            searchText: searchText
        )
        switch sortDeckParameter {
        case .name: _decks = Query(filter: predicate, sort: \.name, order: sortOrder)
        case .date_update: _decks = Query(filter: predicate, sort: \.date_update, order: sortOrder)
        case .date_creation: _decks = Query(filter: predicate, sort: \.date_creation, order: sortOrder)
        }
    }

    var body: some View {
        @Bindable var viewDeckModel = viewDeckModel

        List {
            if decks.isEmpty {
                NavigationLink {
                    DeckNew()
                } label: {
                    Text("Create a Deck")
                }
            } else {
                ForEach(decks) { deck in
                    NavigationLink {
                        DeckViewHome(deck: deck)
                    } label: {
                        DeckRow(deck: deck)
                    }
                }
                .onDelete(perform: deleteItems)
            }
        }
        .toolbar {
            ToolbarItemGroup(placement: .topBarTrailing) {
                DeckSortButton()
                DeckNewButton()
            }

            ToolbarItem(placement: .bottomBar) {
                DeckInfo(count: decks.count)
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
        .environment(ViewDeckModel())
        .environment(ViewCardModel())
}
