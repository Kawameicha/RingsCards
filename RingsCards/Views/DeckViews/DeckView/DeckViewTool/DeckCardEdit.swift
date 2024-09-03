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

    let starterDeckMappings: [String: String] = [
        "9931004": "9904035",
        "9931005": "99131009",
        "9931011": "99132006",
        "9931026": "99131007",
        "9931027": "99131006",
        "9932009": "9901060",
        "9932012": "9908114",
        "9932026": "9908028",
        "9933004": "9922028",
        "9933010": "9901014",
        "9934004": "9902030",
        "9934007": "9906110",
    ]

    var body: some View {
        HStack(alignment: .center, spacing: 3) {
            if card.typeCode == "ally", card.sphereCode != "neutral", card.isUnique {
                let originalKey = "99\(card.code)"
                let key = starterDeckMappings[originalKey] ?? originalKey
                let threat = (card.stats.willpower ?? 0) + (card.stats.attack ?? 0) + (card.stats.defense ?? 0) + (card.stats.health ?? 0)

                Button {
                    if deck.cardSlots[key, default: value] == 0 {
                        deck.threat += threat
                        deck.heroes[key, default: value] = 1
                        deck.cardSlots[key, default: value] = 1
                    } else {
                        deck.threat -= threat
                        deck.heroes[key] = nil
                        deck.cardSlots[key] = nil
                    }
                    deck.updated = .now
                } label: {
                    Image(systemName: "k.circle")
                        .foregroundStyle(deck.cardSlots[key, default: value] == 1 ? .accent : .primary)
                        .opacity(deck.cardSlots[key, default: value] == 1 ? 1 : 0.1)
                }
            }

            Button {
                if value > 1 {
                    deck.cardSlots["\(card.code)", default: value] -= 1
                } else if value == 1 {
                    deck.cardSlots["\(card.code)"] = nil

                    if card.costs.threat != -1 {
                        deck.threat -= card.costs.threat
                        deck.heroes["\(card.code)"] = nil
                    }
                }
                deck.updated = .now
            } label: {
                Image(systemName: "minus.square")
                    .foregroundStyle(value > 0 ? .accent : .primary)
                    .opacity(value > 0 ? 1 : 0.1)
            }

            CardCount(card: card, value: value)

            Button {
                if value < card.deckLimit {
                    deck.cardSlots["\(card.code)", default: value] += 1

                    if card.costs.threat != -1 {
                        deck.threat += card.costs.threat
                        deck.heroes["\(card.code)", default: value] += 1
                    }
                    deck.updated = .now
                }
            } label: {
                Image(systemName: "plus.square")
                    .foregroundStyle(value < card.deckLimit ? .accent : .primary)
                    .opacity(value < card.deckLimit ? 1 : 0.1)
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
