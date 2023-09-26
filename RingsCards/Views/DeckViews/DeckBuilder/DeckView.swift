//
//  DeckView.swift
//  RingsCards
//
//  Created by Christoph Freier on 25.09.23.
//

import SwiftUI
import SwiftData

struct DeckView: View {
    @EnvironmentObject var ringsData: RingsData
    @State private var editDeck = false
    @State private var addCards = false

    var deck: Deck

    var allKeys: [String] { deck.slots.map{String($0.key) } }

    var body: some View {
        NavigationView {
            List {
                ForEach(CardAnatomy.CardType.allCases.map { $0.rawValue.capitalized }, id:\.self) { type in
                    Section(header: Text("\(type)")) {
                        ForEach(deck.slots.sorted(by: >), id: \.key) { key, value in
                            ForEach(ringsData.cards.filter { card in
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
                    .modelContainer(for: Deck.self, inMemory: true)
                    .environmentObject(ringsData)
                    .presentationDetents([.medium, .large])
            }
        }
    }
}

#Preview {
    DeckView(deck: Deck.default)
}
