//
//  CampaignHome.swift
//  RingsCards
//
//  Created by Christoph Freier on 11.11.23.
//

import SwiftUI

struct CampaignHome: View {
    @State private var editBoons = false
    @State private var editNotes = false
    
    var campaign: Campaign

    var body: some View {
        NavigationView {
            List {
                ScenarioVStack(campaign: campaign)
                CampaignCardList(campaign: campaign, editBoons: $editBoons)
            }
            .navigationTitle(campaign.name)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        editBoons.toggle()
                    } label: {
                        Label("Edit Boons", systemImage: "plus.forwardslash.minus")
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
        }
    }
}

#Preview {
    ModelPreview { campaign in
        CampaignHome(campaign: campaign)
    }
    .environmentObject(RingsData())
    .modelContainer(previewModelContainer)
}
