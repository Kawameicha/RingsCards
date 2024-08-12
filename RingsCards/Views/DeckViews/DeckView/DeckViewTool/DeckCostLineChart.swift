//
//  DeckCostLineChart.swift
//  RingsCards
//
//  Created by Christoph Freier on 09.08.24.
//

import SwiftUI
import Charts

struct DeckCostLineChart: View {
    var cards: [Card]
    var deck: Deck

    var body: some View {
        let cardDictionary = Dictionary(uniqueKeysWithValues: cards.filter { $0.costs.cost != "X" }.map { ($0.code, $0) })

        let costs = Array(0...6)
        let costTotals = costs.map { cost -> (String, Int) in
            let total = deck.cardSlots.reduce(0) { result, element in
                let (key, multiplier) = element
                if let card = cardDictionary[key],
                   let cardCost = Int(card.costs.cost),
                   cardCost == cost {
                    return result + (cardCost * multiplier)
                }
                return result
            }
            return (String(cost), total)
        }

        GroupBox(
            label: VStack(alignment: .leading) {
                Text("Card by Cost")
                    .font(.headline)
                Text("Cost X ignored")
                    .font(.caption)
            }
        ) {
            Chart {
                let lastIndexWithNonZeroCount = costTotals.lastIndex(where: { $0.1 > 0 }) ?? costTotals.count - 1

                ForEach(costTotals.prefix(lastIndexWithNonZeroCount + 1), id: \.1) { item in
                    let (value, count) = item
                    LineMark(
                        x: .value("Sphere Type", value),
                        y: .value("Total Count", count)
                    )
                    .foregroundStyle(.gray)
                }
            }
            .aspectRatio(1, contentMode: .fit)
        }
    }
}

//#Preview {
//    ModelPreview { deck in
//        DeckCostLineChart(
//            deck: deck
//        )
//    }
//    .modelContainer(previewModelContainer)
//    .environment(ViewCardModel())
//}
