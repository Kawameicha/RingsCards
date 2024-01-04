//
//  CampaignViewHome.swift
//  RingsCards
//
//  Created by Christoph Freier on 11.11.23.
//

import SwiftUI

struct CampaignViewHome: View {
    @State var editDecks = false
    @State var editHeroes = false
    @State var editBoons = false
    @State var editNotes = false
    @Bindable var campaign: Campaign

    var body: some View {
        ScrollView {
            ScenarioVStack(campaign: campaign)
            //                ForEach(campaign.decks ?? []) { deck in
            //                    CampaignHeroList(campaign: campaign, deck: deck)
            //                }
            CampaignCardList(campaign: campaign, editBoons: $editBoons)
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
    .environmentObject(RingsData())
    .environment(ViewCardModel())
}
