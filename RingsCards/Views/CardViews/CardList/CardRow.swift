//
//  CardRow.swift
//  RingsCards
//
//  Created by Christoph Freier on 21.08.23.
//

import SwiftUI

struct CardRow: View {
    var campaign: Campaign?
    var deck: Deck?
    var card: Card
    var value = 0

    private var cardCost: Image {
        if card.costs.threat != -1 {
            return Image(systemName: "\(card.costs.threat).square")
        } else if card.costs.cost == "X" {
            return Image(systemName: "x.circle")
        } else if card.costs.cost != "" {
            return Image(systemName: "\(Int(card.costs.cost) ?? 0).circle")
        } else {
            return Image(systemName: "x.circle")
        }
    }

    var body: some View {
        HStack(alignment: .center, spacing: 3) {
            cardCost
                .foregroundColor(Color(card.sphereName))
                .font(.system(size: 42))

            VStack(alignment: .leading, spacing: 3) {
                HStack(alignment: .center, spacing: 3) {
                    if card.isUnique {
                        Text("\u{E607}")
                    }

                    Text(card.name)
                        .foregroundColor(Color(card.sphereName))
                        .font(.headline)
                }

                if ["hero", "ally"].contains(card.typeCode) {
                    HStack(alignment: .center, spacing: 3) {
                        Text("\(card.stats.willpower ?? 0)" + " \u{E600}")
                        Text("\(card.stats.attack ?? 0)" + " \u{E601}")
                        Text("\(card.stats.defense ?? 0)" + " \u{E602}")
                        Text("\(card.stats.health ?? 0)" + " \u{E603}")
                    }
                } else if card.texts.traits != "" {
                    Text(card.texts.traits)
                        .foregroundColor(.secondary)
                } else if card.texts.traits == "" {
                    Text(" ")
                }
            }
            .font(Font.custom("SFUIText-Regular", size: 16))

            Spacer()

            if let campaign = campaign {
                CampaignCardEdit(campaign: campaign, card: card, value: campaign.slots["\(card.code)", default: 0])
            } else if let deck = deck {
                DeckCardEdit(deck: deck, card: card, value: deck.cardSlots["\(card.code)", default: 0])
            } else if value != 0 {
                CardCount(card: card, value: value)
            }
        }
        .lineLimit(1)
    }
}

//#Preview {
//    ModelPreview { card in
//        CardRow(card: card)
//    }
//    .modelContainer(previewModelContainer)
//}
