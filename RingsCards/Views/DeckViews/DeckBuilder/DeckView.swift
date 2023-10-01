//
//  DeckView.swift
//  RingsCards
//
//  Created by Christoph Freier on 25.09.23.
//

import SwiftUI
import SwiftData

struct DeckView: View {
    @Environment(\.modelContext) private var modelContext
    @Query(sort: \Card.name, order: .reverse) private var cards: [Card]
    @State private var editDeck = false
    @State private var addCards = false

    var deck: Deck

    var body: some View {
        NavigationView {
            List {
                ForEach(CardAnatomy.CardType.allCases.map { $0.rawValue.capitalized }, id:\.self) { type in
                    Section(header: Text("\(type)")) {
                        ForEach(deck.slots.sorted(by: >), id: \.key) { key, value in
                            ForEach(cards.filter { card in
                                card.code.contains("\(key)") && card.type_name.contains("\(type)")
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
            .listStyle(.sidebar)
            .navigationTitle("\(deck.name)")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Menu(content: {
                        Button {
                            editDeck.toggle()
                        } label: {
                            Label("Edit Deck", systemImage: "plus.forwardslash.minus")
                        }
                        Button {
                            addCards.toggle()
                        } label: {
                            Label("Add Card", systemImage: "plus.rectangle.portrait")
                        }
                    }) {
                        Image(systemName: "ellipsis.circle")
                    }
                }
            }
            .sheet(isPresented: $addCards) {
                DeckAdd(deck: deck)
                    .presentationDetents([.medium, .large])
            }
        }
    }
}

#Preview {
    ModelPreview { deck in
        DeckView(deck: deck)
    }
    .modelContainer(previewModelContainer)
}
