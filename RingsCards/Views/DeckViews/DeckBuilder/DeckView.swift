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

    var body: some View {
        NavigationView {
            List {
                ForEach(CardAnatomy.CardType.allCases.map { $0.rawValue.capitalized }, id:\.self) { type in
                    Section(header: Text("\(type)")) {
                        ForEach(deck.slots.sorted(by: >), id: \.key) { key, value in
                            ForEach(cards.filter { card in
                                (card.code == ("\(key)"))
                                &&
                                (card.type_name.contains("\(type)"))
                            }) {card in
                                NavigationLink {
                                    CardView(card: card)
                                } label: {
                                    if editDeck == false {
                                        CardRow(card: card, value: value)
                                    } else {
                                        DeckEdit(deck: deck, card: card, value: value)
                                    }
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
