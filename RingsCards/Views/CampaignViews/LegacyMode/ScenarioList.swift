//
//  ScenarioList.swift
//  RingsCards
//
//  Created by Christoph Freier on 28.08.23.
//

import SwiftUI
import SwiftData

struct ScenarioList: View {
    @Query var scenarios: [Scenario]
    @State private var searchText: String = ""
    @State private var showingNotes = false
    var campaign: Campaign

    init(
        campaign: Campaign,

        filterCampaign: [Int] = []
    ) {
        self.campaign = campaign

        let predicate = Scenario.predicate(
            filterCampaign: filterCampaign
        )
        _scenarios = Query(filter: predicate, sort: \.id)
    }

    var body: some View {
        List(scenarios) { scenario in
            NavigationLink {
                ScenarioViewHome(campaign: campaign, scenario: scenario)
            } label: {
                ScenarioRow(campaign: campaign, scenario: scenario)
            }
        }
        .listStyle(.sidebar)
        .navigationTitle("\(campaign.name)")
        .searchable(text: $searchText)
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button {
                    showingNotes.toggle()
                } label: {
                    Label("Campaign Notes", systemImage: "list.clipboard")
                }
            }
        }
        .sheet(isPresented: $showingNotes) {
            CampaignHost(campaign: campaign)
                .presentationDetents([.medium, .large])
        }
    }
}

#Preview {
    ModelPreview { campaign in
        ScenarioList(campaign: campaign, filterCampaign: campaign.scenarios)
    }
    .modelContainer(previewModelContainer)
}
