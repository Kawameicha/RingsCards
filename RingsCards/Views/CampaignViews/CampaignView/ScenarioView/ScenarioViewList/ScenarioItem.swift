//
//  ScenarioItem.swift
//  RingsCards
//
//  Created by Christoph Freier on 11.11.23.
//

import SwiftUI

struct ScenarioItem: View {
    @State private var hasChanged = false
    var campaign: Campaign
    var scenario: Scenario
    var scenarioIndex: Int { campaign.scenarios.firstIndex(where: { $0 == scenario.id }) ?? 0 }

    var body: some View {
        GroupBox(
            label: Text("Scenario \(scenarioIndex + 1)")
                .font(.subheadline)
                .foregroundStyle(.white)
                .background(Capsule()
                    .fill(.accent)
                    .frame(width: 90, height: 30))
        ) {
            HStack(alignment: .center) {
                ScenarioViewMark(isSet: Bindable(campaign).completed[scenarioIndex])
                    .onChange(of: campaign.completed[scenarioIndex]) {
                        hasChanged = true
                    }
                    .buttonStyle(PlainButtonStyle())
                    .font(.system(size: 44.0))

                Spacer()

                Text(scenario.name)
                    .font(.headline)

                Spacer()

                ScenarioViewIcon(image: Image(scenario.code))
            }
        }
        .groupBoxStyle(PlainGroupBoxStyle())
        .padding()
        .onDisappear {
            if hasChanged {
                campaign.updated = .now
            }
        }
    }
}

//#Preview {
//    ModelPreview { scenario in
//        ScenarioItem(campaign: Campaign(code: "",
//                                        name: "",
//                                        scenarios: Array(1...3),
//                                        completed: Array(repeating: false, count:3),
//                                        campaignMode: true,
//                                        slots: [:]),
//                     scenario: scenario)
//    }
//    .modelContainer(previewModelContainer)
//}
