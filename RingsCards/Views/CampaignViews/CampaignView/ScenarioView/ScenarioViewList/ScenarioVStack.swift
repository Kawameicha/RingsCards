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
            ScrollViewReader { value in
                GeometryReader { item in
                    ScrollView(.horizontal, showsIndicators: false) {
                        LazyHStack(alignment: .top) {
                            ForEach(scenarios) { scenario in
                                NavigationLink(value: Router.scenarioViewHome(campaign: campaign, scenario: scenario)) {
                                    ScenarioItem(campaign: campaign, scenario: scenario)
                                }
                                .frame(width: item.size.width, alignment: .center)
                            }
                        }
                        .onAppear {
                            value.scrollTo(campaign.scenarios[campaign.completed.firstIndex(of: false) ?? campaign.completed.count - 1])
                        }
                    }
                    .scrollTargetLayout()
                    .scrollClipDisabled()
                }
                .scrollTargetBehavior(.viewAligned)
                .safeAreaPadding(.horizontal)
            }
        }
    }
}

//#Preview {
//    ModelPreview { campaign in
//        ScenarioVStack(campaign: campaign, filterCampaign: campaign.scenarios)
//    }
//    .modelContainer(previewModelContainer)
//}
