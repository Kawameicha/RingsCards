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
            Text("Scenarios")
                .font(.headline)
                .padding(.leading, 15)
                .padding(.top, 5)

            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(scenario) { scenario in
                        NavigationLink {
                            ScenarioView(campaign: campaign, scenario: scenario)
                        } label: {
                            ScenarioItem(campaign: campaign, scenario: scenario)
                        }
                        .containerRelativeFrame(.horizontal, count: 1, span: 1, spacing: 1)
                    }
                }
            }
            .padding()
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
