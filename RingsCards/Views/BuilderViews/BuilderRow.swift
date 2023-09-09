//
//  BuilderRow.swift
//  RingsCards
//
//  Created by Christoph Freier on 08.09.23.
//

import SwiftUI

struct BuilderRow: View {
    @EnvironmentObject var ringsData: RingsData

    var deck: Deck

    var deckIndex: Int {
        ringsData.decks.firstIndex(where: { $0.id == deck.id }) ?? 0
    }

    var card: Card
    var value = 0

    var body: some View {
        HStack(spacing: 9) {
            VStack(spacing: 9) {
                Button {
                    if value < card.deck_limit {
                        ringsData.decks[deckIndex].slots["\(card.code)", default: value] += 1
                    }
                } label: {
                    Image(systemName: "plus.square")
                }
                .buttonStyle(PlainButtonStyle())

                Button {
                    if value > 1 {
                        ringsData.decks[deckIndex].slots["\(card.code)", default: value] -= 1
                    } else if value == 1 {
                        ringsData.decks[deckIndex].slots["\(card.code)"] = nil
                    }
                } label: {
                    Image(systemName: "minus.square")
                }
                .buttonStyle(PlainButtonStyle())
            }

            CardRow(card: card, value: value)
        }
    }
}

struct BuilderRow_Previews: PreviewProvider {
    static var decks = RingsData().decks
    static var cards = RingsData().cards

    static var previews: some View {
        BuilderRow(deck: decks[0], card: cards[0])
            .environmentObject(RingsData())
    }
}
