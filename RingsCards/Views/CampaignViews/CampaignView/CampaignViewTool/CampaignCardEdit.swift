//
//  CampaignCardEdit.swift
//  RingsCards
//
//  Created by Christoph Freier on 10.11.23.
//

import SwiftUI

struct CampaignCardEdit: View {
    var campaign: Campaign
    var card: Card
    var value = 0

    var body: some View {
        HStack(spacing: 9) {
            VStack(spacing: 9) {
                Button {
                    if value < card.deck_limit {
                        campaign.slots["\(card.code)", default: value] += 1
                        campaign.updated = .now
                    }
                } label: {
                    Image(systemName: "plus.square")
                }
                .buttonStyle(PlainButtonStyle())

                Button {
                    if value > 1 {
                        campaign.slots["\(card.code)", default: value] -= 1
                        campaign.updated = .now
                    } else if value == 1 {
                        campaign.slots["\(card.code)"] = 0
                        campaign.updated = .now
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
    ModelPreview { campaign in
        ModelPreview { card in
            CampaignCardEdit(campaign: campaign, card: card)
        }
    }
    .modelContainer(previewModelContainer)
}
