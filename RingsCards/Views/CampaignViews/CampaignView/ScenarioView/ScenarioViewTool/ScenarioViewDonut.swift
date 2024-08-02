//
//  ScenarioViewDonut.swift
//  RingsCards
//
//  Created by Christoph Freier on 01.08.24.
//

import SwiftUI
import Charts

struct ScenarioViewDonut: View {
    var scenario: Scenario
    struct ScenarioStatistics: Identifiable, Hashable {
        var id = UUID()
        let name: String
        let count: Int
        let difficulty: String
    }

    var body: some View {
        let difficulties = scenario.statistics.hasNightmare ? ["Easy", "Normal", "Nightmare"] : ["Easy", "Normal"]
        let statistics = [
            ScenarioStatistics(name: "Enemies", count: scenario.statistics.easyEnemies, difficulty: "Easy"),
            ScenarioStatistics(name: "Locations", count: scenario.statistics.easyLocations, difficulty: "Easy"),
            ScenarioStatistics(name: "Treacheries", count: scenario.statistics.easyTreacheries, difficulty: "Easy"),
            ScenarioStatistics(name: "Enemies", count: scenario.statistics.normalEnemies, difficulty: "Normal"),
            ScenarioStatistics(name: "Locations", count: scenario.statistics.normalLocations, difficulty: "Normal"),
            ScenarioStatistics(name: "Treacheries", count: scenario.statistics.normalTreacheries, difficulty: "Normal"),
            ScenarioStatistics(name: "Enemies", count: scenario.statistics.nightmareEnemies, difficulty: "Nightmare"),
            ScenarioStatistics(name: "Locations", count: scenario.statistics.nightmareLocations, difficulty: "Nightmare"),
            ScenarioStatistics(name: "Treacheries", count: scenario.statistics.nightmareTreacheries, difficulty: "Nightmare")
        ]

        VStack(alignment: .leading) {
            ScrollViewReader { value in
                GeometryReader { item in
                    ScrollView(.horizontal, showsIndicators: false) {
                        LazyHStack(alignment: .top) {
                            ForEach(difficulties, id: \.self) { difficulty in
                                VStack {
                                    Text(difficulty)
                                        .font(.headline)
                                        .padding(.bottom, 10)

                                    HStack {
                                        Chart {
                                            ForEach(statistics.filter { statistic in
                                                statistic.difficulty.contains("\(difficulty)")
                                            }) { chart in
                                                SectorMark(
                                                    angle: .value("Count", chart.count),
                                                    innerRadius: .ratio(0.7),
                                                    angularInset: 3.0
                                                )
                                                .foregroundStyle(by: .value("Name", chart.name))
                                                .cornerRadius(10.0)
                                                .opacity(0.7)
                                                .annotation(position: .overlay) {
                                                    Text("\(chart.count)")
                                                        .font(.headline)
                                                        .foregroundStyle(.white)
                                                }
                                            }
                                        }
                                    }
                                }
                                .frame(width: item.size.width, alignment: .center)
                                .chartBackground { proxy in
                                    Text("\u{E604}")
                                        .font(Font.custom("SFUIText-Regular", size: 36))
                                }
                                .chartForegroundStyleScale([
                                    "Enemies": .red,
                                    "Locations": .brown,
                                    "Treacheries": .mint
                                ])
                                .chartLegend(position: .bottom, alignment: .center, spacing: 36)
                            }
                        }
                        .onAppear {
                            value.scrollTo(difficulties[1])
                        }
                    }
                    .scrollTargetLayout()
                    .scrollClipDisabled()
                }
                .scrollTargetBehavior(.viewAligned)
                .safeAreaPadding(.horizontal)
            }
        }
    }
}

//#Preview {
//    ModelPreview { scenario in
//        ScenarioViewDonut(scenario: scenario)
//    }
//    .modelContainer(previewModelContainer)
//}
