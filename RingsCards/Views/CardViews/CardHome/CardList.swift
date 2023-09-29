//
//  CardList.swift
//  RingsCards
//
//  Created by Christoph Freier on 20.08.23.
//

import SwiftUI
import SwiftData

struct CardList: View {
    @Environment(ViewModel.self) private var viewModel
    @Environment(\.modelContext) private var modelContext
    @Query private var cards: [Card]

    init(
        sortParameter: SortParameter = .name,
        sortOrder: SortOrder = .forward,
        searchText: String = ""
    ) {
        let predicate = Card.predicate(searchText: searchText)
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
            .navigationTitle("Player Cards")
            .searchable(text: $viewModel.searchText)
            .toolbar {
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
    CardList()
        .environment(ViewModel())
        .modelContainer(previewModelContainer)
}
