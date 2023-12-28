//
//  CardList.swift
//  RingsCards
//
//  Created by Christoph Freier on 27.12.23.
//

import SwiftUI
import SwiftData

struct CardList: View {
    @Environment(ViewCardModel.self) private var viewCardModel
    @Environment(\.modelContext) private var modelContext
    @Query private var cards: [Card]

    init(
        filterSphere: FilterSphere = .all,
        filterType: FilterType = .any,
        filterPack: [String] = [],
        filterDeck: [String] = [],
        sortParameter: SortParameter = .name,
        sortOrder: SortOrder = .forward,
        searchText: String = ""
    ) {
        let predicate = Card.predicate(searchText: searchText,
                                       filterSphere: filterSphere.rawValue,
                                       filterType: filterType.rawValue,
                                       filterPack: filterPack,
                                       filterDeck: filterDeck)
        switch sortParameter {
        case .name: _cards = Query(filter: predicate, sort: \.name, order: sortOrder)
        case .sphere: _cards = Query(filter: predicate, sort: \.sphere_code, order: sortOrder)
        }
    }

    var body: some View {
        @Bindable var viewCardModel = viewCardModel

        NavigationStack {
            List {
                ForEach(CardType.allCases.map { $0.rawValue.capitalized }, id:\.self) { type in
                    Section(header: Text("\(type)")) {
                        ForEach(cards.filter { card in
                            card.type_name.contains("\(type)")
                        }) {card in
                            NavigationLink {
                                CardView(card: card)
                            } label: {
                                CardRow(card: card)
                            }
                        }
                    }
                }
            }
            .toolbar {
                ToolbarItem(placement: .bottomBar) {
                    CardInfo(count: cards.count)
                }
            }
        }
    }
}

#Preview {
    CardList()
        .modelContainer(previewModelContainer)
        .environment(ViewCardModel())
}
