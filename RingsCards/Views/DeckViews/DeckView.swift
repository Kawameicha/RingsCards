//
//  DeckView.swift
//  RingsCards
//
//  Created by Shane Eastwood on 2023-08-22.
//

import SwiftUI

struct DeckView: View {
    @EnvironmentObject var ringsData: RingsData
    @State private var editDeck = false
    @State private var addCards = false

    var deck: Deck

    // Merge new cards into slots
//    var campaignSlots: [String:Int] {
//        deck.slots.merging(["01132": 1]) { (_, new) in new }
//    }

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
                                        BuilderRow(deck: deck, card: card, value: value)
                                    }
                                }
                            }
                        }
                    }
                }

                Section(header: Text("Side Slots")) {
                    ForEach(deck.sideslots.sorted(by: <), id: \.key) { key, value in
                        ForEach(ringsData.cards.filter { card in
                            card.code.contains("\(key)")
                        }) {card in
                            NavigationLink {
                                CardView(card: card)
                            } label: {
                                if editDeck == false {
                                    CardRow(card: card, value: value)
                                } else {
                                    BuilderRow(deck: deck, card: card, value: value)
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
                BuilderAdd(deck: deck)
                    .environmentObject(ringsData)
                    .presentationDetents([.medium, .large])
            }
        }
    }
}

struct DeckView_Previews: PreviewProvider {
    static var decks = RingsData().decks

    static var previews: some View {
        DeckView(deck: decks[0])
            .environmentObject(RingsData())
    }
}
