//
//  CardList.swift
//  RingsCards
//
//  Created by Christoph Freier on 27.12.23.
//

import SwiftUI
import SwiftData

struct CardList: View {
    @Environment(ViewCardModel.self) var viewCardModel
    @Environment(\.modelContext) var modelContext
    @Query var cards: [Card]

    @Bindable var deck: Deck
    @Binding var editCard: Bool
    @Binding var viewCard: Bool

    init(
        deck: Deck,
        editCard: Binding<Bool>,
        viewCard: Binding<Bool>,

        filterSphere: FilterSphere = .all,
        filterType: FilterType = .any,
        filterPack: [String] = [],
        filterDeck: [String] = [],
        sortParameter: SortParameter = .name,
        sortOrder: SortOrder = .forward,
        searchText: String = ""
    ) {
        self.deck = deck
        self._editCard = editCard
        self._viewCard = viewCard

        let predicate = Card.predicate(
            searchText: searchText,
            filterSphere: filterSphere.rawValue,
            filterType: filterType.rawValue,
            filterPack: filterPack,
            filterDeck: filterDeck
        )
        switch sortParameter {
        case .code: _cards = Query(filter: predicate, sort: \.code, order: sortOrder)
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
                        }) { card in
                            NavigationLink {
                                CardView(card: card)
                            } label: {
                                if editCard {
                                    DeckViewEdit(deck: deck, card: card, value: deck.slots["\(card.code)", default: 0])
                                } else {
                                    CardRow(card: card)
                                }
                            }
                        }
                    }
                }
            }
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    FilterButton()
                }

                ToolbarItem(placement: .topBarTrailing) {
                    SortButton()
                }

                ToolbarItem(placement: .bottomBar) {
                    CardInfo(count: cards.count, deck: deck)
                }
            }
        }
    }
}

#Preview {
    ModelPreview { deck in
        CardList(deck: deck, editCard: .constant(false), viewCard: .constant(false))
    }
    .modelContainer(previewModelContainer)
    .environment(ViewCardModel())
    .environment(ViewDeckModel())
}
