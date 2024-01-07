//
//  CampaignViewHome.swift
//  RingsCards
//
//  Created by Christoph Freier on 11.11.23.
//

import SwiftUI

struct CampaignViewHome: View {
    @State var editBoons = false
    @State var editNotes = false
    @Bindable var campaign: Campaign

    var body: some View {
        List {
            Text("Scenarios")
                .font(.headline)
            ScenarioVStack(campaign: campaign, filterCampaign: campaign.scenarios)
                .frame(height: 120)
                .listRowSeparator(.hidden)

            Text("Boons & Burdens")
                .font(.headline)
                .listRowSeparator(.hidden)
            CardList(deck: Deck.emptyDeck,
                     deckView: false,
                     campaign: campaign,
                     campaignView: true,
                     editCard: .constant(false),
                     viewCard: .constant(false),
                     editBoons: $editBoons)
        }
        .navigationTitle($campaign.name)
        .toolbar {
            ToolbarItemGroup(placement: .topBarTrailing) {
                CampaignBoonButton(editBoons: $editBoons)
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
        CampaignViewHome(campaign: campaign)
    }
    .modelContainer(previewModelContainer)
    .environment(ViewCardModel())
}
