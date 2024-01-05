//
//  ScenarioVStack.swift
//  RingsCards
//
//  Created by Christoph Freier on 11.11.23.
//

import SwiftUI

struct ScenarioVStack: View {
    @EnvironmentObject var ringsData: RingsData

    var campaign: Campaign
    var scenario: [Scenario] {
        ringsData.scenarios.filter{ scenario in
            campaign.scenarios.contains(scenario.id)
        }
    }

    var body: some View {
        VStack(alignment: .leading) {
            GeometryReader { item in
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(alignment: .top, spacing: 0) {
                        ForEach(scenario) { scenario in
                            NavigationLink {
                                ScenarioView(campaign: campaign, scenario: scenario)
                            } label: {
                                ScenarioItem(campaign: campaign, scenario: scenario)
                            }
                            .frame(width: item.size.width,alignment: .center)
                        }
                    }
                }
            }
            .padding()
            .onAppear {
                UIScrollView.appearance().isPagingEnabled = true
            }
        }
    }
}

#Preview {
    ModelPreview { campaign in
        ScenarioVStack(campaign: campaign)
    }
    .environmentObject(RingsData())
    .modelContainer(previewModelContainer)
}
