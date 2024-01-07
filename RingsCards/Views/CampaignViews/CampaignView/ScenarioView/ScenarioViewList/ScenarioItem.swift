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
        GroupBox {
            HStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: 3) {
                ScenarioViewMark(isSet: Bindable(campaign).completed[scenarioIndex])
                    .buttonStyle(PlainButtonStyle())
                    .font(.system(size: 44.0))

                VStack(alignment: .leading, spacing: 3) {
                    Text("Scenario \(scenarioIndex + 1)")
                        .font(.subheadline)
                    
                    Text(scenario.name)
                        .font(.headline)
                }
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
