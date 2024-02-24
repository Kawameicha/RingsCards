//
//  ScenarioRow.swift
//  RingsCards
//
//  Created by Christoph Freier on 28.08.23.
//

import SwiftUI

struct ScenarioRow: View {
    var campaign: Campaign
    var scenario: Scenario
    var scenarioIndex: Int { campaign.scenarios.firstIndex(where: { $0 == scenario.id }) ?? 0 }

    var body: some View {
        HStack(spacing: 3) {
            ScenarioViewMark(isSet: Bindable(campaign.self).completed[scenarioIndex])
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
        ScenarioRow(campaign: Campaign(code: "",
                                       name: "",
                                       scenarios: Array(1...3),
                                       completed: Array(repeating: false, count:3),
                                       campaignMode: true,
                                       slots: [:]),
                    scenario: scenario)
    }
    .modelContainer(previewModelContainer)
}
