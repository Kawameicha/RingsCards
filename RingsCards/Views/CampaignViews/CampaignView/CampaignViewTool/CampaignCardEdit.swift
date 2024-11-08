//
//  CampaignCardEdit.swift
//  RingsCards
//
//  Created by Christoph Freier on 10.11.23.
//

import SwiftUI

struct CampaignCardEdit: View {
    @State private var hasChanged = false
    var campaign: Campaign
    var card: Card
    var value = 0

    var body: some View {
        HStack(alignment: .center, spacing: 3) {
            Button {
                if value > 1 {
                    campaign.slots["\(card.code)", default: 0] -= 1
                    hasChanged = true
                } else if value == 1 {
                    campaign.slots["\(card.code)"] = 0
                    hasChanged = true
                }
            } label: {
                if value > 0 {
                    Image(systemName: "minus.square")
                        .foregroundStyle(.accent)
                } else {
                    Image(systemName: "minus.square")
                        .opacity(0.1)
                }
            }

            CardCount(card: card, value: value)

            Button {
                if value < card.deckLimit {
                    campaign.slots["\(card.code)", default: 0] += 1
                    hasChanged = true
                }
            } label: {
                if value < card.deckLimit {
                    Image(systemName: "plus.square")
                        .foregroundStyle(.accent)
                } else {
                    Image(systemName: "plus.square")
                        .opacity(0.1)
                }
            }
        }
        .buttonStyle(PlainButtonStyle())
        .font(.system(size: 24))
        .onDisappear {
            if hasChanged {
                campaign.updated = .now
            }
        }
    }
}

//#Preview {
//    ModelPreview { campaign in
//        ModelPreview { card in
//            CampaignCardEdit(campaign: campaign, card: card)
//        }
//    }
//    .modelContainer(previewModelContainer)
//}
