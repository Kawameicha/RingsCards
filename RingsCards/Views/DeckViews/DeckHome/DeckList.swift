//
//  DeckList.swift
//  RingsCards
//
//  Created by Christoph Freier on 28.08.23.
//

import SwiftUI
import SwiftData

struct DeckList: View {
    @Environment(ViewCardModel.self) private var viewCardModel
    @Environment(ViewDeckModel.self) private var viewDeckModel
    @Environment(\.modelContext) private var modelContext
    @Query(sort: \Deck.date_update, order: .reverse) private var decks: [Deck]

    init(
        sortDeckParameter: SortDeckParameter = .name,
        sortOrder: SortOrder = .forward,
        searchText: String = ""
    ) {
        let predicate = Deck.predicate(searchText: searchText)
        switch sortDeckParameter {
        case .name: _decks = Query(filter: predicate, sort: \.name, order: sortOrder)
        case .date_creation: _decks = Query(filter: predicate, sort: \.date_creation, order: sortOrder)
        case .date_update: _decks = Query(filter: predicate, sort: \.date_update, order: sortOrder)
        }
    }

    var body: some View {
        @Bindable var viewDeckModel = viewDeckModel

        NavigationView {
            List {
                if decks.isEmpty {
                    NavigationLink(destination: DeckNew(),
                                   label: { Text("Create a Deck") })
                } else {
                    ForEach(decks) { deck in
                        NavigationLink {
                            DeckView(deck: deck,
                                     filterSphere: viewCardModel.filterSphere,
                                     filterType: viewCardModel.filterType,
//                                     filterPack: viewCardModel.filterPack,
                                     filterDeck: deck.slots.map{ String($0.key) },
                                     sortParameter: viewCardModel.sortParameter,
                                     sortOrder: viewCardModel.sortOrder,
                                     searchText: viewCardModel.searchText)
                        } label: {
                            DeckRow(deck: deck)
                        }
                    }
                    .onDelete(perform: deleteItems)
                }
            }
            .listStyle(.sidebar)
            .navigationTitle("My Decks")
            .searchable(text: $viewDeckModel.searchText)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    DeckSort()
                }

                ToolbarItem(placement: .topBarTrailing) {
                    NavigationLink(destination: DeckNew(),
                                   label: { Image(systemName: "plus") })
                }

                ToolbarItem(placement: .bottomBar) {
                    DeckInfo(count: decks.count)
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
        .environment(ViewCardModel())
        .environment(ViewDeckModel())
}
