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
    @Query private var packs: [Collection]
    @Query private var cards: [Card]

    var collection: [String] {
        packs.map { pack in
            pack.isInCollection ? pack.packCode : ""
        }
    }

    init(
        filterSphere: FilterSphere = .all,
        filterType: FilterType = .any,
        sortParameter: SortParameter = .name,
        sortOrder: SortOrder = .forward,
        searchText: String = ""
    ) {
        let predicate = Card.predicate(searchText: searchText,
                                       filterSphere: filterSphere.rawValue,
                                       filterType: filterType.rawValue)
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
                            &&
                            card.pack_code.within(collection)
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
            .refreshable {
                await CardResponse.refresh(modelContext: modelContext)
            }
            .navigationTitle("Player Cards")
            .searchable(text: $viewModel.searchText)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    FilterButton()
                }
                
                ToolbarItem(placement: .topBarTrailing) {
                    SortButton()
                }

                ToolbarItem(placement: .bottomBar) {
                    CardInfo(count: cards.filter({ card in card.pack_code.within(collection) }).count)
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
