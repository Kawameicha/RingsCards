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

    var body: some View {
        HStack(alignment: .center, spacing: 3) {
            if card.costs.threat != -1 {
                Image(systemName: "\(card.costs.threat).square")
                    .foregroundColor(Color(card.sphereName))
                    .font(.system(size: 42))
            } else if card.costs.cost == "X" {
                Image(systemName: "x.circle")
                    .foregroundColor(Color(card.sphereName))
                    .font(.system(size: 42))
            } else if card.costs.cost != "" {
                Image(systemName: "\(Int(card.costs.cost) ?? 0).circle")
                    .foregroundColor(Color(card.sphereName))
                    .font(.system(size: 42))
            } else {
                Image(systemName: "x.circle")
                    .foregroundColor(Color(card.sphereName))
                    .font(.system(size: 42))
            }

            VStack(alignment: .leading, spacing: 3) {
                if card.isUnique == true {
                    HStack {
                        Text("\u{E607}")
                            .font(Font.custom("SFUIText-Regular", size: 14))
                        Text(card.name)
                            .foregroundColor(Color(card.sphereName))
                            .font(.headline)
                    }
                } else {
                    Text(card.name)
                        .foregroundColor(Color(card.sphereName))
                        .font(.headline)
                }

                if card.typeCode == "hero" || card.typeCode == "ally" {
                    HStack {
                        Text("\(card.stats.willpower ?? 0)" + " \u{E600}")
                            .font(Font.custom("SFUIText-Regular", size: 14))
                        Text("\(card.stats.attack ?? 0)" + " \u{E601}")
                            .font(Font.custom("SFUIText-Regular", size: 14))
                        Text("\(card.stats.defense ?? 0)" + " \u{E602}")
                            .font(Font.custom("SFUIText-Regular", size: 14))
                        Text("\(card.stats.health ?? 0)" + " \u{E603}")
                            .font(Font.custom("SFUIText-Regular", size: 14))
                    }
                } else if card.texts.traits != "" {
                    Text(card.texts.traits)
                        .foregroundColor(.secondary)
                        .font(.subheadline)
                }
            }

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
