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
        GroupBox(
            label: Text("Scenario \(scenarioIndex + 1)")
                .font(.subheadline)
                .foregroundStyle(.white)
                .background(Capsule()
                        .fill(.yellow)
                        .frame(width: 90, height: 30))
        ) {
            HStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/) {
                ScenarioViewMark(isSet: Bindable(campaign).completed[scenarioIndex])
                    .onChange(of: campaign.completed[scenarioIndex]) {
                        campaign.updated = .now
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
//        .background(Color.yellow.frame(height: 20), alignment: .top)
//        .background(Capsule()
//                .fill(.red)
//                .frame(width: 250, height: 50))
        .padding()
//        .background(
//            PackIcon(image: Image(campaign.code), frame: 44)
//                .resizable()
//        )
//        .backgroundStyle(.blue.gradient)
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
