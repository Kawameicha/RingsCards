//
//  CampaignViewHome.swift
//  RingsCards
//
//  Created by Christoph Freier on 11.11.23.
//

import SwiftUI

struct CampaignViewHome: View {
    @Bindable var campaign: Campaign
    @State var editBoon = false
    @State var editNote = false
    var decks: [Deck]

    init(
        campaign: Campaign,
        decks: [Deck]
    ) {
        self.campaign = campaign
        self.decks = campaign.decks
    }

    var body: some View {
        List {
            Section {
                Image(campaign.code + "_cover")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .listRowInsets(EdgeInsets())

                GroupBox {
                    ScenarioVStack(campaign: campaign, filterCampaign: campaign.scenarios)
                        .frame(height: 100)
                }
                .groupBoxStyle(PlainGroupBoxStyle())
            }

            Section {
                DeckList(campaign: campaign)
            }

            if campaign.campaignMode == true {
                Section {
                    Text("Boons & Burdens")
                    CardList(
                        campaign: campaign,
                        editBoon: $editBoon,
                        filterPack: [],
                        filterDeck: campaign.slots.map { String($0.key) },
                        sortParameter: SortParameter.code
                    )
                }
            }
        }
        .navigationTitle($campaign.name)
        .toolbar {
            ToolbarItemGroup(placement: .topBarTrailing) {
                if campaign.campaignMode == true {
                    CampaignBoonButton(editBoon: $editBoon)
                }
                CampaignNoteButton(editNote: $editNote)
            }

            ToolbarItem(placement: .status) {
                CampaignScenarioInfo(campaign: campaign)
            }
        }
        .sheet(isPresented: $editNote) {
            CampaignHost(campaign: campaign)
                .presentationDetents([.medium, .large])
        }
    }
}

//#Preview {
//    ModelPreview { campaign in
//        CampaignViewHome(campaign: campaign, decks: [Deck.emptyDeck])
//    }
//    .modelContainer(previewModelContainer)
//    .environment(ViewCardModel())
//    .environment(ViewDeckModel())
//}
