//
//  DeckAdd.swift
//  RingsCards
//
//  Created by Christoph Freier on 25.09.23.
//

import SwiftUI
import SwiftData

struct DeckAdd: View {
    @Environment(ViewModel.self) private var viewModel
    @Environment(\.modelContext) private var modelContext
    @Query private var cards: [Card]

    var deck: Deck

    init(
        deck: Deck,

        filterSphere: FilterSphere = .all,
        filterType: FilterType = .any,
        filterPack: [String] = [],
        filterDeck: [String] = [],
        sortParameter: SortParameter = .name,
        sortOrder: SortOrder = .forward,
        searchText: String = ""
    ) {
        self.deck = deck

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
        @Bindable var viewModel = viewModel

        NavigationView {
            List {
                ForEach(CardAnatomy.CardType.allCases.map { $0.rawValue.capitalized }, id:\.self) { type in
                    Section(header: Text("Add \(type)")) {
                        ForEach(cards.filter { card in
                            (card.type_name.contains("\(type)"))
                        }) { card in
                            NavigationLink {
                                CardView(card: card)
                            } label: {
                                DeckEdit(deck: deck, card: card)
                            }
                        }
                    }
                }
            }
            .navigationTitle("Add Cards")
            .searchable(text: $viewModel.searchText)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    FilterButton()
                }

                ToolbarItem(placement: .topBarTrailing) {
                    SortButton()
                }

                ToolbarItem(placement: .bottomBar) {
                    CardInfo(count: cards.count)
                }
            }
        }
    }
}

#Preview {
    ModelPreview { deck in
        DeckAdd(deck: deck)
    }
    .environment(ViewModel())
    .modelContainer(previewModelContainer)
}
