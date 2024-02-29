//
//  ScenarioList.swift
//  RingsCards
//
//  Created by Christoph Freier on 28.08.23.
//

import SwiftUI
import SwiftData

struct ScenarioList: View {
    @Environment(ViewCampaignModel.self) var viewCampaignModel
    
    @State private var showingNotes = false
    
    private var campaign: Campaign
    private var filterCampaign: [Int]

    init(
        campaign: Campaign,
        filterCampaign: [Int] = []
    ) {
        self.campaign = campaign
        self.filterCampaign = filterCampaign
    }

    var body: some View {
        @Bindable var viewCampaignModel = viewCampaignModel
        
        ScenarioListView(campaign: campaign,
                         filterCampaign: filterCampaign,
                         searchText: viewCampaignModel.searchText)
            .searchable(text: $viewCampaignModel.searchText)
            .disableAutocorrection(true)
            .navigationTitle("\(campaign.name)")
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

private struct ScenarioListView: View {
    @Query var scenarios: [Scenario]
    
    private var campaign: Campaign
    
    init(
        campaign: Campaign,
        filterCampaign: [Int] = [],
        searchText: String
    ) {
        self.campaign = campaign

        let predicate = Scenario.predicate(
            searchText: searchText,
            filterCampaign: filterCampaign
        )
        _scenarios = Query(filter: predicate, sort: \.id)
    }
    
    var body: some View {
        List(scenarios) { scenario in
            NavigationLink(value: Router.scenarioViewHome(campaign: campaign, scenario: scenario)) {
                ScenarioRow(campaign: campaign, scenario: scenario)
            }
        }
        .listStyle(.sidebar)
    }
}

#Preview {
    ModelPreview { campaign in
        ScenarioList(campaign: campaign, filterCampaign: campaign.scenarios)
    }
    .modelContainer(previewModelContainer)
    .environment(ViewCampaignModel())
}
