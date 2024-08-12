//
//  DeckSphereChart.swift
//  RingsCards
//
//  Created by Christoph Freier on 08.08.24.
//

import SwiftUI
import Charts

struct DeckSphereChart: View {
    var cards: [Card]
    var deck: Deck

    var body: some View {
        let cardDictionary = Dictionary(uniqueKeysWithValues: cards.map { ($0.code, $0) })

        let spheres = ["leadership", "tactics", "spirit", "lore", "neutral", "fellowship", "baggins"]
        let sphereColors: [String: Color] = [
            "leadership": .leadership,
            "tactics": .tactics,
            "spirit": .spirit,
            "lore": .lore,
            "neutral": .neutral,
            "fellowship": .fellowship,
            "baggins": .baggins
        ]

        let sphereTotals = spheres.map { sphere -> (String, Int, Color) in
            let total = deck.cardSlots.reduce(0) { result, element in
                let (key, multiplier) = element
                if let card = cardDictionary[key], card.typeCode != "hero" && card.sphereCode == sphere {
                    return result + multiplier
                }
                return result
            }
            return (sphere.capitalized, total, sphereColors[sphere] ?? .gray)
        }

        GroupBox(
            label: VStack(alignment: .leading) {
                Text("Card by Sphere")
                    .font(.headline)
                Text("Draw deck only")
                    .font(.caption)
            }
        ) {
            Chart {
                ForEach(sphereTotals, id: \.0) { item in
                    let (sphere, count, color) = item
                    if count > 0 {
                        BarMark(
                            x: .value("Sphere Type", sphere),
                            y: .value("Total Count", count)
                        )
                        .foregroundStyle(color)
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
//        DeckSphereChart(
//            deck: deck
//        )
//    }
//    .modelContainer(previewModelContainer)
//    .environment(ViewCardModel())
//}
