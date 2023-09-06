//
//  ScenarioRow.swift
//  RingsCards
//
//  Created by Christoph Freier on 28.08.23.
//

import SwiftUI

struct ScenarioRow: View {
    @EnvironmentObject var ringsData: RingsData

    var campaign: Campaign

    var campaignIndex: Int {
        ringsData.campaigns.firstIndex(where: { $0.id == campaign.id })!
    }

    var scenario: Scenario

    var scenarioIndex: Int {
        ringsData.scenarios.firstIndex(where: { $0.id == scenario.id })!
    }

    var body: some View {
        HStack(spacing: 3) {
            CompletedMark(isSet: $ringsData.campaigns[campaignIndex].scenarioCompleted[scenarioIndex])
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

struct ScenarioRow_Previews: PreviewProvider {
    static var campaigns = RingsData().campaigns
    static var scenarios = RingsData().scenarios

    static var previews: some View {
            ScenarioRow(campaign: campaigns[0], scenario: scenarios[0])
                .environmentObject(RingsData())
    }
}
