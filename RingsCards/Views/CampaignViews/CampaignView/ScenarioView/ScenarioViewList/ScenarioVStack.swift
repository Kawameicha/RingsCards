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
    @State var scrollID: Int? = 0
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
//        VStack {
            ScrollViewReader { value in
                ScrollView(.horizontal, showsIndicators: false) {
                    LazyHStack(spacing: 0) {
                        ForEach(0..<scenarios.count, id: \.self) { index in
                            let scenario = scenarios[index]

                            VStack {
                                NavigationLink(value: Router.scenarioViewHome(campaign: campaign, scenario: scenario)) {
                                    ScenarioItem(campaign: campaign, scenario: scenario)
                                }
                            }
                            .containerRelativeFrame(.horizontal)
                            .transitionStyle()
                        }
                    }
                    .scrollTargetLayout()
                }
                .onAppear {
                    if campaign.completed.allSatisfy({ $0 }) {
                        scrollID = campaign.scenarios.count - 1
                    } else if campaign.completed.allSatisfy({ !$0 }) {
                        scrollID = 0
                    } else {
                        scrollID = campaign.completed.firstIndex(of: false)!
                    }

                    value.scrollTo(scrollID)
                }
                .scrollPosition(id: $scrollID)
                .scrollTargetBehavior(.paging)

                IndicatorView(scenarioCount: scenarios.count, scrollID: $scrollID)
            }
//        }
    }
}

//#Preview {
//    ModelPreview { campaign in
//        ScenarioVStack(campaign: campaign, filterCampaign: campaign.scenarios)
//    }
//    .modelContainer(previewModelContainer)
//}
