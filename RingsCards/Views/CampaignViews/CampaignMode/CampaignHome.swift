//
//  CampaignHome.swift
//  RingsCards
//
//  Created by Christoph Freier on 11.11.23.
//

import SwiftUI

struct CampaignHome: View {
    @State private var editDecks = false
    @State private var editHeroes = false
    @State private var editBoons = false
    @State private var editNotes = false
    
    @Bindable var campaign: Campaign

    var body: some View {
        NavigationView {
            List {
                ScenarioVStack(campaign: campaign)

//                ForEach(campaign.decks ?? []) { deck in
//                    CampaignHeroList(campaign: campaign, deck: deck)
//                }
//
//                CampaignHeroFallen(campaign: campaign, editHeroes: $editHeroes)

                CampaignCardList(campaign: campaign, editBoons: $editBoons)
            }
            .navigationTitle($campaign.name)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
//                ToolbarItem(placement: .topBarTrailing) {
//                    Button {
//                        editDecks.toggle()
//                    } label: {
//                        Label("Edit Decks", systemImage: "person.2")
//                    }
//                }
                
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        editBoons.toggle()
                    } label: {
                        Label("Edit Boons", systemImage: "rectangle.portrait.on.rectangle.portrait.angled")
                    }
                }

                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        editNotes.toggle()
                    } label: {
                        Label("Edit Notes", systemImage: "list.clipboard")
                    }
                }
            }
            .sheet(isPresented: $editNotes) {
                CampaignHost(campaign: campaign)
                    .presentationDetents([.medium, .large])
            }
            .sheet(isPresented: $editDecks) {
                CampaignDeckHost(campaign: campaign)
                    .presentationDetents([.medium, .large])
            }
        }
    }
}

#Preview {
    ModelPreview { campaign in
        CampaignHome(campaign: campaign)
    }
    .environmentObject(RingsData())
    .environment(ViewCardModel())
    .modelContainer(previewModelContainer)
}
