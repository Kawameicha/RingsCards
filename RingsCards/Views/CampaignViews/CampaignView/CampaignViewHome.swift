//
//  CampaignViewHome.swift
//  RingsCards
//
//  Created by Christoph Freier on 11.11.23.
//

import SwiftUI

struct CampaignViewHome: View {
    @Environment(ViewDeckModel.self) var viewDeckModel
    @Environment(\.modelContext) var modelContext
    @State var editBoons = false
    @State var editNotes = false
    @Bindable var campaign: Campaign
    var decks: [Deck]

    init(editBoons: Bool = false,
         editNotes: Bool = false,
         campaign: Campaign,
         decks: [Deck]
    ) {
        self.campaign = campaign
        self.decks = campaign.decks
    }

    var body: some View {
        List {
            Section {
                GroupBox(
                    label: Label(
                        title: { Text("Scenarios") },
                        icon: { PackIcon(image: Image(campaign.code), frame: 20) }
                    )
                ) {
                    ScenarioVStack(campaign: campaign, filterCampaign: campaign.scenarios)
                        .frame(height: 100)
                }
                .groupBoxStyle(PlainGroupBoxStyle())
            }

            Section {
                Text("Decks")
                DeckList(campaign: campaign, campaignView: true, campaignDeck: false)
            }

            if campaign.campaignMode == true {
                Section {
                    Text("Boons & Burdens")
                    CardList(
                        deck: Deck.emptyDeck,
                        deckView: false,
                        campaign: campaign,
                        campaignView: true,
                        editCard: .constant(false),
                        viewCard: .constant(false),
                        editBoons: $editBoons,
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
                    CampaignBoonButton(editBoons: $editBoons)
                }
                CampaignNoteButton(editNotes: $editNotes)
            }
        }
        .sheet(isPresented: $editNotes) {
            CampaignHost(campaign: campaign)
                .presentationDetents([.medium, .large])
        }
    }
}

#Preview {
    ModelPreview { campaign in
        CampaignViewHome(campaign: campaign, decks: [Deck.emptyDeck])
    }
    .modelContainer(previewModelContainer)
    .environment(ViewCardModel())
    .environment(ViewDeckModel())
}
