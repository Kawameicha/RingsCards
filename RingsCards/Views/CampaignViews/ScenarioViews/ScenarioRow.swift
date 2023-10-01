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
    var scenario: Scenario

    var scenarioIndex: Int {
        ringsData.scenarios.firstIndex(where: { $0.nameCanonical == scenario.nameCanonical }) ?? 0
    }

    var body: some View {
        HStack(spacing: 3) {
            CompletedMark(isSet: Bindable(campaign.self).completed[scenarioIndex])
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

//struct ScenarioRow_Previews: PreviewProvider {
//    static var campaigns = RingsData().campaigns
//    static var scenarios = RingsData().scenarios
//
//    static var previews: some View {
//            ScenarioRow(campaign: Campaign.default, scenario: scenarios[0])
//                .environmentObject(RingsData())
//    }
//}
