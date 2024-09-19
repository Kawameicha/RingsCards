//
//  DeckChartVStack.swift
//  RingsCards
//
//  Created by Christoph Freier on 09.08.24.
//

import SwiftUI
import SwiftData

struct DeckChartVStack: View {
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
            filterDeck: deck.cardSlots.map { String($0.key) }
        )
        _cards = Query(filter: predicate)
    }

    var body: some View {
        let charts: [AnyView] = [
            AnyView(DeckSphereChart(cards: cards, deck: deck)),
            AnyView(DeckTypeChart(cards: cards, deck: deck)),
            AnyView(DeckCostChart(cards: cards, deck: deck)),
            AnyView(DeckCostLineChart(cards: cards, deck: deck)),
            AnyView(DeckStatChart(cards: cards, deck: deck))
        ]

        VStack(alignment: .center) {
            Text("Deck Statistics")
                .font(.title)
                .fontWeight(.bold)
                .padding(.horizontal, 20)
                .padding(.vertical, 10)

            ScrollViewReader { value in
                GeometryReader { item in
                    ScrollView(.horizontal, showsIndicators: false) {
                        LazyHStack(alignment: .top) {
                            ForEach(charts.indices, id: \.self) { index in
                                charts[index]
                                    .frame(width: item.size.width, height: item.size.height, alignment: .center)
                                    .transitionStyle()
                            }
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
//    ModelPreview { deck in
//        DeckChartVStack(deck: deck)
//    }
//    .modelContainer(previewModelContainer)
//    .environment(ViewCardModel())
//    .environment(ViewDeckModel())
//}
