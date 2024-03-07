//
//  ScenarioViewHome.swift
//  RingsCards
//
//  Created by Christoph Freier on 29.08.23.
//

import SwiftUI

struct ScenarioViewHome: View {
    var campaign: Campaign
    var scenario: Scenario

    var scenarioIndex: Int {
        campaign.scenarios.firstIndex(where: { $0 == scenario.id }) ?? 0
    }

    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                    VStack {
                        Text(scenario.name)
                            .font(.title)

                        ScenarioViewIcon(image: Image(scenario.code), frame: 80)

                        Text(campaign.name)
                    }
                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .center)

                Divider()

                Text(.init(scenario.flavorText.intro))
                    .foregroundStyle(.secondary)
                    .font(.system(size: 18, weight: .light, design: .serif))
                    .italic()

                Divider()

                Text("The *\(scenario.name)* encounter deck is built with all the cards from the following encounter sets:")

                ScenarioViewEncounter(scenario: scenario)
                
                ScenarioViewChart(scenario: scenario)

                Text("The rules for each of the keywords present in the *\(scenario.name)* encounter deck are as follows:")

                ScenarioKeywordList(scenario: scenario)

                if scenario.flavorText.rules != "" {
                    Text(.init(scenario.flavorText.rules.iconsAndSpheres()))
                        .font(Font.custom("SFUIText-Regular", size: 16))
                }

                if campaign.self.completed[scenarioIndex] && scenario.flavorText.outro != "" {
                    Divider()

                    Text(.init(scenario.flavorText.outro))
                        .foregroundStyle(.secondary)
                        .font(.system(size: 18, weight: .light, design: .serif))
                        .italic()

                    Divider()
                }
            }
            .padding()
        }
        .toolbar {
            ToolbarItem(placement: .status) {
                ScenarioCompleted(campaign: campaign, scenario: scenario)
            }
        }
    }
}

#Preview {
    ModelPreview { scenario in
        ScenarioViewHome(campaign: Campaign(code: "",
                                            name: "",
                                            scenarios: Array(1...3),
                                            completed: Array(repeating: false, count:3),
                                            campaignMode: true,
                                            slots: [:]),
                         scenario: scenario)
    }
    .modelContainer(previewModelContainer)
}
