//
//  DeckCampaignList.swift
//  RingsCards
//
//  Created by Christoph Freier on 04.09.24.
//

import SwiftUI

struct DeckCampaignList: View {
    var deck: Deck

    var body: some View {
        VStack(alignment: .center) {
            Text("Played in")
                .font(.title)
                .fontWeight(.bold)
                .padding(.horizontal, 20)
                .padding(.vertical, 10)

            List {
                ForEach(deck.campaigns ?? [Campaign.emptyCampaign]) { campaign in
                    NavigationLink(value: Router.campaignViewHome(campaign: campaign, decks: campaign.decks)) {
                        CampaignRow(campaign: campaign)
                    }
                    .listRowBackground(
                        CampaignImage(campaign: campaign)
                    )
                }
                .listRowSpacing(10.0)
            }
            .padding()
        }
    }
}
