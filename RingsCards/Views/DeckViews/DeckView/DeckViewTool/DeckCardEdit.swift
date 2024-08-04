//
//  DeckCardEdit.swift
//  RingsCards
//
//  Created by Christoph Freier on 25.09.23.
//

import SwiftUI

struct DeckCardEdit: View {
    var deck: Deck
    var card: Card
    var value = 0

    var body: some View {
        HStack(alignment: .center, spacing: 3) {
            Button {
                if value > 1 {
                    deck.cardSlots["\(card.code)", default: value] -= 1
                    deck.updated = .now
                } else if value == 1 {
                    deck.cardSlots["\(card.code)"] = nil
                    deck.updated = .now

                    if card.costs.threat != -1 {
                        deck.threat -= card.costs.threat
                        deck.heroes["\(card.code)"] = nil
                    }
                }
            } label: {
                Image(systemName: "minus")
            }

            CardCount(card: card, value: value)

            Button {
                if value < card.deckLimit {
                    deck.cardSlots["\(card.code)", default: value] += 1
                    deck.updated = .now

                    if card.costs.threat != -1 {
                        deck.threat += card.costs.threat
                        deck.heroes["\(card.code)", default: value] += 1
                    }
                }
            } label: {
                Image(systemName: "plus")
            }
        }
        .buttonStyle(PlainButtonStyle())
        .font(.system(size: 24))
    }
}

//#Preview {
//    ModelPreview { deck in
//        ModelPreview { card in
//            DeckCardEdit(deck: deck, card: card)
//        }
//    }
//    .modelContainer(previewModelContainer)
//}
