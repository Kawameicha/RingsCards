//
//  DeckTypeChart.swift
//  RingsCards
//
//  Created by Christoph Freier on 09.08.24.
//

import SwiftUI
import Charts

struct DeckTypeChart: View {
    var cards: [Card]
    var deck: Deck

    struct ChartDataItem: Identifiable {
        let id = UUID()
        let type: String
        let sphere: String
        let count: Int
        let cardSort: Int
        
        var color: Color {
            let colorMap: [String: Color] = [
                "leadership": .leadership,
                "tactics": .tactics,
                "spirit": .spirit,
                "lore": .lore,
                "neutral": .neutral,
                "fellowship": .fellowship,
                "baggins": .baggins
            ]
            return colorMap[sphere.lowercased()] ?? .gray
        }
    }

    var body: some View {
        let cardDictionary = Dictionary(uniqueKeysWithValues: cards.map { ($0.code, $0) })

        let chartData: [ChartDataItem] = {
            var typeSphereCounts: [String: [String: (count: Int, cardSort: Int)]] = [:]

            deck.cardSlots.forEach { element in
                let (key, multiplier) = element

                if let card = cardDictionary[key],
                   card.typeName != "Hero",
                   card.typeName != "Contract",
                   card.typeName != "Campaign" {
                    let type = card.typeName
                    let sphere = card.sphereName

                    if typeSphereCounts[type] == nil {
                        typeSphereCounts[type] = [:]
                    }

                    if var existing = typeSphereCounts[type]?[sphere] {
                        existing.count += multiplier
                        existing.cardSort = min(existing.cardSort, card.cardSort)
                        typeSphereCounts[type]?[sphere] = existing
                    } else {
                        typeSphereCounts[type]?[sphere] = (multiplier, card.cardSort)
                    }
                }
            }

            var data: [ChartDataItem] = []

            for (type, sphereDict) in typeSphereCounts {
                for (sphere, value) in sphereDict {
                    data.append(ChartDataItem(type: type, sphere: sphere, count: value.count, cardSort: value.cardSort))
                }
            }

            return data.sorted { $0.cardSort < $1.cardSort }
        }()

        GroupBox(
            label: VStack(alignment: .leading) {
                Text("Card by Type and Sphere")
                    .font(.headline)
                Text("Draw deck only")
                    .font(.caption)
            }
        ) {
            Chart {
                ForEach(chartData) { item in
                    if item.count > 0 {
                        BarMark(
                            x: .value("Type", item.type),
                            y: .value("Count", item.count)
                        )
                        .foregroundStyle(item.color)
                        .cornerRadius(5.0)
                    }
                }
            }
            .aspectRatio(1, contentMode: .fit)
        }
    }
}

//#Preview {
//    ModelPreview { deck in
//        DeckTypeChart(
//            deck: deck
//        )
//    }
//    .modelContainer(previewModelContainer)
//    .environment(ViewCardModel())
//}
