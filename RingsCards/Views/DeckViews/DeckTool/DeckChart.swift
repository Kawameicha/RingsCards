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

        let willpower = deck.heroes.reduce(0) { result, element in
            let (key, multiplier) = element
            if let card = cardDictionary[key], let stat = card.stats.willpower {
                return result + (stat * multiplier)
            }
            return result
        }
        let attack = deck.heroes.reduce(0) { result, element in
            let (key, multiplier) = element
            if let card = cardDictionary[key], let stat = card.stats.attack {
                return result + (stat * multiplier)
            }
            return result
        }
        let defense = deck.heroes.reduce(0) { result, element in
            let (key, multiplier) = element
            if let card = cardDictionary[key], let stat = card.stats.defense {
                return result + (stat * multiplier)
            }
            return result
        }
        let health = deck.heroes.reduce(0) { result, element in
            let (key, multiplier) = element
            if let card = cardDictionary[key], let stat = card.stats.health {
                return result + (stat * multiplier)
            }
            return result
        }

        VStack {
            Chart {
                BarMark(
                    x: .value("Shape Type", "W"),
                    y: .value("Total Count", willpower)
                )
                BarMark(
                    x: .value("Shape Type", "A"),
                    y: .value("Total Count", attack)
                )
                BarMark(
                    x: .value("Shape Type", "D"),
                    y: .value("Total Count", defense)
                )
                BarMark(
                    x: .value("Shape Type", "H"),
                    y: .value("Total Count", health)
                )
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
