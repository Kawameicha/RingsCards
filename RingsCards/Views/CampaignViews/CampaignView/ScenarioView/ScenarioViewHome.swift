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

                        ScenarioViewIcon(image: Image(scenario.code))

                        Text(scenario.pack)
                    }
                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .center)

                Divider()

                Text(.init(scenario.flavorText.flavorIntro))
                    .font(.system(size: 18, weight: .light, design: .serif))
                    .italic()

                Divider()

                Text("The *\(scenario.name)* encounter deck is built with all the cards from the following encounter sets:")

                ScenarioViewEncounter(scenario: scenario)
                
                ScenarioViewChart(scenario: scenario)

                Text("The rules for each of the keywords present in the *\(scenario.name)* encounter deck are as follows:")

                ScenarioKeywordList(scenario: scenario)

                if scenario.flavorText.ruling != "" {
                    Text(.init(scenario.flavorText.ruling.iconsAndSpheres()))
                        .font(Font.custom("SFUIText-Regular", size: 16))
                }

                VStack {
                    Text("Scenario Completed!")
                        .foregroundColor(campaign.self.completed[scenarioIndex] ? .green : .gray)
                    Toggle("Completed", isOn: Bindable(campaign.self).completed[scenarioIndex])
                        .labelsHidden()
                }
                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .center)
                .padding()
                .overlay(
                    RoundedRectangle(cornerRadius: 15)
                        .stroke(lineWidth: 2)
                        .foregroundColor(campaign.self.completed[scenarioIndex] ? .green : .gray)
                )
                
                if campaign.self.completed[scenarioIndex] {
                    if scenario.flavorText.doNotRead != "" {
                        Text(.init(scenario.flavorText.doNotRead))
                            .font(.system(size: 18, weight: .light, design: .serif))
                            .italic()
                    }
                }
            }
            .padding()
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
