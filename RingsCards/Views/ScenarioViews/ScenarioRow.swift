//
//  ScenarioRow.swift
//  RingsCards
//
//  Created by Christoph Freier on 28.08.23.
//

import SwiftUI

struct ScenarioRow: View {
    @EnvironmentObject var ringsData: RingsData

    var scenario: Scenario

    var scenarioIndex: Int {
        ringsData.scenarios.firstIndex(where: { $0.id == scenario.id })!
    }

    var body: some View {
        HStack(spacing: 3) {
            CompletedMark(isSet: $ringsData.campaigns.scenarioCompleted[scenarioIndex])
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
    static var scenarios = RingsData().scenarios

    static var previews: some View {
        Group {
            ScenarioRow(scenario: scenarios[0])
                .environmentObject(RingsData())
        }
    }
}
