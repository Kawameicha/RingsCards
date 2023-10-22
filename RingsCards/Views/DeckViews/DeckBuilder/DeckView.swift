//
//  DeckView.swift
//  RingsCards
//
//  Created by Christoph Freier on 25.09.23.
//

import SwiftUI
import SwiftData

struct DeckView: View {
    @Environment(ViewModel.self) private var viewModel
    @Environment(\.modelContext) private var modelContext
    @Query private var cards: [Card]
    @Query private var packs: [Pack]
    @State private var editDeck = false
    @State private var addCards = false

    var collection: [String] {
        packs.map { pack in
            pack.isInCollection ? pack.packCode : ""
        }
    }

    var deck: Deck

    init(
        deck: Deck,

        filterSphere: FilterSphere = .all,
        filterType: FilterType = .any,
        filterPack: [String] = [],
        filterDeck: [String] = [],
        sortParameter: SortParameter = .name,
        sortOrder: SortOrder = .forward,
        searchText: String = ""
    ) {
        self.deck = deck

        let predicate = Card.predicate(searchText: searchText,
                                       filterSphere: filterSphere.rawValue,
                                       filterType: filterType.rawValue,
                                       filterPack: filterPack,
                                       filterDeck: self.deck.slots.map{ String($0.key) })
        switch sortParameter {
        case .name: _cards = Query(filter: predicate, sort: \.name, order: sortOrder)
        case .sphere: _cards = Query(filter: predicate, sort: \.sphere_code, order: sortOrder)
        }
    }

    var body: some View {
        NavigationView {
            List {
                ForEach(CardAnatomy.CardType.allCases.map { $0.rawValue.capitalized }, id:\.self) { type in
                    Section(header: Text("\(type)")) {
                        ForEach(cards.filter { card in
                            (card.type_name.contains("\(type)"))
                        }) {card in
                            NavigationLink {
                                CardView(card: card)
                            } label: {
                                if editDeck == false {
                                    CardRow(card: card, value: deck.self.slots["\(card.code)", default: 0])
                                } else {
                                    DeckEdit(deck: deck, card: card, value: deck.self.slots["\(card.code)", default: 0])
                                }
                            }
                        }
                    }
                }
            }
            .navigationTitle("\(deck.name)")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        editDeck.toggle()
                    } label: {
                        Label("Edit Deck", systemImage: "plus.forwardslash.minus")
                    }
                }
                
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        addCards.toggle()
                    } label: {
                        Label("Add Card", systemImage: "plus.rectangle.portrait")
                    }
                }
            }
            .sheet(isPresented: $addCards) {
                DeckAdd(deck: deck,
                        filterSphere: viewModel.filterSphere,
                        filterType: viewModel.filterType,
                        filterPack: collection,
//                        filterDeck: viewModel.filterDeck,
                        sortParameter: viewModel.sortParameter,
                        sortOrder: viewModel.sortOrder,
                        searchText: viewModel.searchText)
                    .presentationDetents([.medium, .large])
            }
        }
    }
}

#Preview {
    ModelPreview { deck in
        DeckView(deck: deck)
    }
    .environment(ViewModel())
    .modelContainer(previewModelContainer)
}
