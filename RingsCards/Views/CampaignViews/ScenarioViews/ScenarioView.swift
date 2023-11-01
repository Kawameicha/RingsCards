//
//  ScenarioView.swift
//  RingsCards
//
//  Created by Christoph Freier on 29.08.23.
//

import SwiftUI

struct ScenarioView: View {
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

                        CircleIcon(image: Image(scenario.nameCanonical))

                        Text(scenario.pack)
                    }
                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .center)

                Divider()

                Text(scenario.flavorIntro)
                    .font(.system(size: 18, weight: .light, design: .serif))
                    .italic()

                Divider()

                Text("The *\(scenario.name)* encounter deck is built with all the cards from the following encounter sets:")

                EncounterList(scenario: scenario)

                Text("The rules for each of the keywords present in the *\(scenario.name)* encounter deck are as follows:")

                KeywordList(scenario: scenario)

                if scenario.ruling != "" {
                    Text(.init(scenario.ruling ?? ""))
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
                    if scenario.doNotRead != "" {
                        Text(scenario.doNotRead)
                            .font(.system(size: 18, weight: .light, design: .serif))
                            .italic()
                    }
                }

                ScenarioChart(scenario: scenario)
            }
            .padding()
        }
    }
}

//struct ScenarioView_Previews: PreviewProvider {
//    static var scenarios = RingsData().scenarios
//
//    static var previews: some View {
//            ScenarioView(scenario: scenarios[0])
//    }
//}
