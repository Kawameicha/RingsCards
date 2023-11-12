//
//  ScenarioItem.swift
//  RingsCards
//
//  Created by Christoph Freier on 11.11.23.
//

import SwiftUI

struct ScenarioItem: View {
    @EnvironmentObject var ringsData: RingsData

    var campaign: Campaign
    var scenario: Scenario

    var scenarioIndex: Int {
        campaign.scenarios.firstIndex(where: { $0 == scenario.id }) ?? 0
    }

    var body: some View {
            HStack(spacing: 0) {
                CompletedMark(isSet: Bindable(campaign).completed[scenarioIndex])
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
        .frame(minWidth: 300, maxWidth: 300)
    }
}
