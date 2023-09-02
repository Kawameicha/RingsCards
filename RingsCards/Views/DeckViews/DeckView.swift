//
//  DeckView.swift
//  RingsCards
//
//  Created by Shane Eastwood on 2023-08-22.
//

import SwiftUI

struct DeckView: View {
    @EnvironmentObject var ringsData: RingsData

    var deck: Deck

    var body: some View {
        let allTypes: [String] = ["Hero", "Ally", "Attachment", "Event"]

        NavigationView {
            List {
                ForEach(allTypes, id:\.self) { type in
                    Section(header: Text("\(type)")) {
                        ForEach(deck.slots.sorted(by: >), id: \.key) { key, value in
                            ForEach(ringsData.cards.filter { card in
                                card.code.contains("\(key)") && card.type_name.contains("\(type)")
                            }) {card in
                                NavigationLink {
                                    CardView(card: card)
                                } label: {
                                    CardRow(card: card, value: value)
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
                                CardRow(card: card, value: value)
                            }
                        }
                    }
                }
            }
            .listStyle(.sidebar)
            .navigationTitle("\(deck.name)")
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
