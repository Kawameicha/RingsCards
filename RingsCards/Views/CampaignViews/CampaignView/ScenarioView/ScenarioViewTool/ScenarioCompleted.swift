//
//  ScenarioCompleted.swift
//  RingsCards
//
//  Created by Christoph Freier on 07.03.24.
//

import SwiftUI

struct ScenarioCompleted: View {
    @State private var hasChanged = false
    var campaign: Campaign
    var scenario: Scenario

    var scenarioIndex: Int {
        campaign.scenarios.firstIndex(where: { $0 == scenario.id }) ?? 0
    }

    var body: some View {
        HStack {
            Toggle("Completed", isOn: Bindable(campaign).completed[scenarioIndex])
                .toggleStyle(CheckBoxStyle())
                .onChange(of: campaign.completed[scenarioIndex]) {
                    hasChanged = true
                }
        }
        .onDisappear {
            if hasChanged {
                campaign.updated = .now
            }
        }
    }
}

//#Preview {
//    ModelPreview { scenario in
//        ScenarioCompleted(campaign: Campaign(code: "",
//                                             name: "",
//                                             scenarios: Array(1...3),
//                                             completed: Array(repeating: false, count:3),
//                                             campaignMode: true,
//                                             slots: [:]),
//                          scenario: scenario)
//    }
//    .modelContainer(previewModelContainer)
//}
