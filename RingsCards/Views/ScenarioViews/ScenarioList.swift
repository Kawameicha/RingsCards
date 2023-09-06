//
//  ScenarioList.swift
//  RingsCards
//
//  Created by Christoph Freier on 28.08.23.
//

import SwiftUI

struct ScenarioList: View {
    @EnvironmentObject var ringsData: RingsData
    @State private var searchText: String = ""
    @State private var showingNotes = false

    var campaign: Campaign

    var campaignOnly: [Scenario] {
        ringsData.scenarios.filter{ scenario in
            campaign.scenarios.contains(scenario.id)
        }
    }

    var filteredScenarios: [Scenario] {
        guard !searchText.isEmpty else { return campaignOnly }
        return campaignOnly.filter { scenario in
            scenario.name.lowercased().cleaned().contains(searchText.lowercased())
        }
    }

    var body: some View {
        NavigationView {
            List(filteredScenarios) { scenario in
                NavigationLink {
                    ScenarioView(scenario: scenario)
                } label: {
                    ScenarioRow(campaign: campaign, scenario: scenario)
                }
            }
            .listStyle(.sidebar)
            .navigationTitle("\(campaign.name)")
            .searchable(text: $searchText)
            .toolbar {
                Button {
                    showingNotes.toggle()
                } label: {
                    Label("Campaign Notes", systemImage: "ellipsis.circle")
                }
            }
            .sheet(isPresented: $showingNotes) {
                CampaignHost(campaign: campaign)
                    .environmentObject(ringsData)
                    .presentationDetents([.medium, .large])
            }
        }
    }
}

struct ScenarioList_Previews: PreviewProvider {
    static var previews: some View {
        ScenarioList(campaign: Campaign.default)
            .environmentObject(RingsData())
    }
}
