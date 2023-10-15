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
            scenario.name.localizedStandardContains(searchText)
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
                ToolbarItem(placement: .navigationBarTrailing) {
                    Menu(content: {
                        Button {
                            showingNotes.toggle()
                        } label: {
                            Label("Campaign Notes", systemImage: "list.clipboard")
                        }
                    }) {
                        Image(systemName: "ellipsis.circle")
                    }
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

#Preview {
    ModelPreview { campaign in
        ScenarioList(campaign: campaign)
    }
    .environmentObject(RingsData())
    .modelContainer(previewModelContainer)
}
