//
//  ScenarioItem.swift
//  RingsCards
//
//  Created by Christoph Freier on 11.11.23.
//

import SwiftUI

struct ScenarioItem: View {
    var campaign: Campaign
    var scenario: Scenario
    var scenarioIndex: Int { campaign.scenarios.firstIndex(where: { $0 == scenario.id }) ?? 0 }

    var body: some View {
        HStack(spacing: 0) {
            ScenarioViewMark(isSet: Bindable(campaign).completed[scenarioIndex])
                .buttonStyle(PlainButtonStyle())
                .font(.system(size: 42.0))

            VStack(alignment: .leading, spacing: 3) {
                Text(scenario.name)
                    .font(.headline)

                Text(scenario.pack)
                    .foregroundColor(.secondary)
                    .font(.subheadline)
            }
        }
    }
}

#Preview {
    ModelPreview { scenario in
        ScenarioItem(campaign: Campaign(name: "",
                                        code: "",
                                        scenarios: Array(1...3),
                                        completed: Array(repeating: false, count:3),
                                        campaignMode: true,
                                        slots: [:]),
                     scenario: scenario)
    }
    .modelContainer(previewModelContainer)
}
