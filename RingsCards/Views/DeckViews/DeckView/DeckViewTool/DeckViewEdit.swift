//
//  DeckViewEdit.swift
//  RingsCards
//
//  Created by Christoph Freier on 25.09.23.
//

import SwiftUI

struct DeckViewEdit: View {
    var deck: Deck
    var card: Card
    var value = 0

    var body: some View {
        HStack(spacing: 9) {
            VStack(spacing: 9) {
                Button {
                    if value < card.deck_limit {
                        deck.slots["\(card.code)", default: value] += 1
                        deck.date_update = .now

                        if card.threat != nil {
                            deck.starting_threat += card.threat ?? 0
                            deck.heroes["\(card.code)", default: value] += 1
                        }
                    }
                } label: {
                    Image(systemName: "plus.square")
                }
                .buttonStyle(PlainButtonStyle())

                Button {
                    if value > 1 {
                        deck.slots["\(card.code)", default: value] -= 1
                        deck.date_update = .now
                    } else if value == 1 {
                        deck.slots["\(card.code)"] = nil
                        deck.date_update = .now

                        if card.threat != nil {
                            deck.starting_threat -= card.threat ?? 0
                            deck.heroes["\(card.code)"] = nil
                        }
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

#Preview {
    ModelPreview { deck in
        ModelPreview { card in
            DeckViewEdit(deck: deck, card: card)
        }
    }
    .modelContainer(previewModelContainer)
}
