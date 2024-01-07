//
//  ScenarioViewChart.swift
//  RingsCards
//
//  Created by Christoph Freier on 12.09.23.
//

import SwiftUI
import Charts

struct ScenarioViewChart: View {
    var scenario: Scenario

    struct ScenarioByDifficulty: Identifiable {
        var id = UUID()
        let key: String
        let value: Int
        let difficulty: String
    }

    var body: some View {
        let currentScenario: [ScenarioByDifficulty] = [
            ScenarioByDifficulty(key: "Enemies", value: scenario.statistics.easyEnemies, difficulty: "Easy"),
            ScenarioByDifficulty(key: "Locations", value: scenario.statistics.easyLocations, difficulty: "Easy"),
            ScenarioByDifficulty(key: "Treacheries", value: scenario.statistics.easyTreacheries, difficulty: "Easy"),
            ScenarioByDifficulty(key: "Enemies", value: scenario.statistics.normalEnemies, difficulty: "Normal"),
            ScenarioByDifficulty(key: "Locations", value: scenario.statistics.normalLocations, difficulty: "Normal"),
            ScenarioByDifficulty(key: "Treacheries", value: scenario.statistics.normalTreacheries, difficulty: "Normal"),
            ScenarioByDifficulty(key: "Enemies", value: scenario.statistics.nightmareEnemies, difficulty: "Nightmare"),
            ScenarioByDifficulty(key: "Locations", value: scenario.statistics.nightmareLocations, difficulty: "Nightmare"),
            ScenarioByDifficulty(key: "Treacheries", value: scenario.statistics.nightmareTreacheries, difficulty: "Nightmare")
        ]

        VStack {
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
            }
            .padding()
            .frame(height: 250)
        }
    }
}

#Preview {
    ModelPreview { scenario in
        ScenarioViewChart(scenario: scenario)
    }
    .modelContainer(previewModelContainer)
}
