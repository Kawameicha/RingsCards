//
//  DeckStatChart.swift
//  RingsCards
//
//  Created by Christoph Freier on 09.08.24.
//

import SwiftUI
import Charts

struct DeckStatChart: View {
    var cards: [Card]
    var deck: Deck

    var body: some View {
        let cardDictionary = Dictionary(uniqueKeysWithValues: cards.map { ($0.code, $0) })

        let stats = ["willpower", "attack", "defense", "health"]
            let statTotals = stats.map { statType -> (String, Int) in
                let total = deck.cardSlots.reduce(0) { result, element in
                    let (key, multiplier) = element
                    if let card = cardDictionary[key], card.typeCode == "ally" {
                        let stat: Int?
                        switch statType {
                        case "willpower": stat = card.stats.willpower
                        case "attack": stat = card.stats.attack
                        case "defense": stat = card.stats.defense
                        case "health": stat = card.stats.health
                        default: stat = nil
                        }
                        if let stat = stat {
                            return result + (stat * multiplier)
                        }
                    }
                    return result
                }
                return (statType.capitalized, total)
            }

        GroupBox(
            label: VStack(alignment: .leading) {
                Text("Ally Card Stats")
                    .font(.headline)
                Text("Heroes excluded")
                    .font(.caption)
            }
        ) {
            Chart {
                ForEach(statTotals, id: \.0) { item in
                    let (stat, count) = item
                    if count > 0 {
                        BarMark(
                            x: .value("Stat Type", stat),
                            y: .value("Total Count", count)
                        )
                        .foregroundStyle(.gray)
                        .cornerRadius(5.0)
                        .annotation(position: .automatic) {
                            Text("\(count)")
                                .font(.headline)
                                .foregroundStyle(.white)
                        }
                    }
                }
            }
            .aspectRatio(1, contentMode: .fit)
        }
    }
}

//#Preview {
//    ModelPreview { deck in
//        DeckStatChart(
//            deck: deck
//        )
//    }
//    .modelContainer(previewModelContainer)
//    .environment(ViewCardModel())
//}
