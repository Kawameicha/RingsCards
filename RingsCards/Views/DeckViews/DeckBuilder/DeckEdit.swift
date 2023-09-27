//
//  DeckEdit.swift
//  RingsCards
//
//  Created by Christoph Freier on 25.09.23.
//

import SwiftUI
import SwiftData

struct DeckEdit: View {
    @EnvironmentObject var ringsData: RingsData

    var deck: Deck
    var card: Card
    var value = 0

    var body: some View {
        HStack(spacing: 9) {
            VStack(spacing: 9) {
                Button {
                    if value < card.deck_limit {
                        deck.self.slots["\(card.code)", default: value] += 1
                    }
                } label: {
                    Image(systemName: "plus.square")
                }
                .buttonStyle(PlainButtonStyle())

                Button {
                    if value > 1 {
                        deck.self.slots["\(card.code)", default: value] -= 1
                    } else if value == 1 {
                        deck.self.slots["\(card.code)"] = nil
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
        DeckEdit(deck: deck, card: RingsData().cards[0])
    }
    .modelContainer(previewModelContainer)
}
