//
//  ScenarioVStack.swift
//  RingsCards
//
//  Created by Christoph Freier on 11.11.23.
//

import SwiftUI
import SwiftData

struct ScenarioVStack: View {
    @Query var scenarios: [Scenario]
    var campaign: Campaign

    init(
        campaign: Campaign,

        filterCampaign: [Int] = []
    ) {
        self.campaign = campaign

        let predicate = Scenario.predicate(
            searchText: "",
            filterCampaign: filterCampaign
        )
        _scenarios = Query(filter: predicate, sort: \.id)
    }

    var body: some View {
        VStack(alignment: .leading) {
            GeometryReader { item in
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(alignment: .top) {
                        ForEach(scenarios) { scenario in
                            NavigationLink(value: Router.scenarioViewHome(campaign: campaign, scenario: scenario)) {
                                ScenarioItem(campaign: campaign, scenario: scenario)
                            }
                            .frame(width: item.size.width, alignment: .center)
                        }
                    }
                }
                .scrollTargetLayout()
                .scrollClipDisabled()
            }
            .scrollTargetBehavior(.paging)
            .safeAreaPadding(.horizontal)
        }
    }
}

#Preview {
    ModelPreview { campaign in
        ScenarioVStack(campaign: campaign, filterCampaign: campaign.scenarios)
    }
    .modelContainer(previewModelContainer)
}
