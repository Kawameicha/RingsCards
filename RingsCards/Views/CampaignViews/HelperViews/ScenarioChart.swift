//
//  ScenarioChart.swift
//  RingsCards
//
//  Created by Christoph Freier on 12.09.23.
//

import SwiftUI
import Charts

struct ScenarioChart: View {
    var scenario: Scenario

    struct ScenarioByDifficulty: Identifiable {
        var id = UUID()
        let key: String
        let value: Int
        let difficulty: String
    }

    var body: some View {
        let currentScenario: [ScenarioByDifficulty] = [
            ScenarioByDifficulty(key: "Enemies", value: scenario.easy_enemies, difficulty: "Easy"),
            ScenarioByDifficulty(key: "Locations", value: scenario.easy_locations, difficulty: "Easy"),
            ScenarioByDifficulty(key: "Treacheries", value: scenario.easy_treacheries, difficulty: "Easy"),
            ScenarioByDifficulty(key: "Enemies", value: scenario.normal_enemies, difficulty: "Normal"),
            ScenarioByDifficulty(key: "Locations", value: scenario.normal_locations, difficulty: "Normal"),
            ScenarioByDifficulty(key: "Treacheries", value: scenario.normal_treacheries, difficulty: "Normal"),
            ScenarioByDifficulty(key: "Enemies", value: scenario.nightmare_enemies, difficulty: "Nightmare"),
            ScenarioByDifficulty(key: "Locations", value: scenario.nightmare_locations, difficulty: "Nightmare"),
            ScenarioByDifficulty(key: "Treacheries", value: scenario.nightmare_treacheries, difficulty: "Nightmare")
        ]

        VStack {
//            GroupBox ("Encounter Cards by Difficulty") {
                Chart(currentScenario) {
                    let cardNr = Int($0.value)
                    BarMark(
                        x: .value("Value", $0.value),
                        y: .value("Key", $0.difficulty)
                    )
                    .opacity(0.7)
                    .clipShape(RoundedRectangle(cornerRadius: 5))
                    .foregroundStyle(by: .value("Difficulty", $0.key))
                    .annotation(position: .overlay, alignment: .center, spacing: 0) {
                        Text("\(cardNr)")
                            .font(.system(size: 12))
                            .foregroundColor(.white)
                    }
//                }
            }
                .padding()
            .frame(height: 250)
        }
    }
}

struct ScenarioChart_Previews: PreviewProvider {
    static var scenarios = RingsData().scenarios

    static var previews: some View {
        ScenarioChart(scenario: scenarios[0])
    }
}
