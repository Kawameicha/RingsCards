//
//  DeckChart.swift
//  RingsCards
//
//  Created by Christoph Freier on 24.06.24.
//

import SwiftUI
import SwiftData
import Charts

struct DeckChart: View {
    @Environment(ViewCardModel.self) var viewCardModel
    @Environment(\.modelContext) var modelContext
    @Query var cards: [Card]
    var deck: Deck

    init(
        deck: Deck = Deck.emptyDeck,

        filterSphere: FilterSphere = .all,
        filterType: FilterType = .any,
        filterPack: [String] = [],
        filterDeck: [String] = [],
        sortParameter: SortParameter = .name,
        sortOrder: SortOrder = .forward,
        searchText: String = "",
        searchBy: SearchParameter = .name
    ) {
        self.deck = deck

        let predicate = Card.predicate(
            searchText: searchText,
            searchBy: searchBy,
            filterSphere: filterSphere.rawValue,
            filterType: filterType.rawValue,
            filterPack: filterPack,
            filterDeck: deck.heroes.map { String($0.key) }
        )
        _cards = Query(filter: predicate)
    }

    var body: some View {
        let cardDictionary = Dictionary(uniqueKeysWithValues: cards.map { ($0.code, $0) })

        let stats = ["willpower", "attack", "defense", "health"]
            let statTotals = stats.map { statType -> (String, Int) in
                let total = deck.heroes.reduce(0) { result, element in
                    let (key, multiplier) = element
                    if let card = cardDictionary[key] {
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

        VStack {
            Chart {
                ForEach(statTotals, id: \.0) { item in
                    let (stat, count) = item
                    BarMark(
                        x: .value("Stat Type", stat),
                        y: .value("Total Count", count)
                    )
                }
            }
            .chartXAxis(.hidden)
            .chartYAxis(.hidden)
            .foregroundStyle(.white)
            .frame(width: 44, height: 22)

            Text("\u{E600} \u{E601} \u{E602} \u{E603}")
                .foregroundStyle(.white)
                .font(Font.custom("SFUIText-Regular", size: 9))
        }
    }
}

//#Preview {
//    ModelPreview { deck in
//        DeckChart(
//            deck: deck
//        )
//    }
//    .modelContainer(previewModelContainer)
//    .environment(ViewCardModel())
//}
