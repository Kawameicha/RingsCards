//
//  DeckViewHome.swift
//  RingsCards
//
//  Created by Christoph Freier on 30.12.23.
//

import SwiftUI
import SwiftData

struct DeckViewHome: View {
    @Environment(ViewCardModel.self) var viewCardModel
    @Environment(\.modelContext) var modelContext
    @Query(filter: #Predicate<Pack> { pack in
        pack.isInCollection }) var packs: [Pack]
    @State var editCard = false
    @State var viewCard = false
    @Bindable var deck: Deck

    var body: some View {
        @Bindable var viewCardModel = viewCardModel

        NavigationView {
            if viewCard {
                CardList(
                    deck: deck,
                    deckView: true,
                    editCard: .constant(true),
                    viewCard: $viewCard,
                    filterSphere: viewCardModel.filterSphere,
                    filterType: viewCardModel.filterType,
                    filterPack: packs.map { $0.packCode },
                    filterDeck: [],
                    sortParameter: viewCardModel.sortParameter,
                    sortOrder: viewCardModel.sortOrder,
                    searchText: viewCardModel.searchText
                )
                .navigationTitle($deck.name)
                .navigationBarTitleDisplayMode(.inline)
                .searchable(text: $viewCardModel.searchText)
                .toolbar {
                    ToolbarItemGroup(placement: .topBarTrailing) {
                        DeckViewButton(viewCard: $viewCard)
                    }

                    ToolbarItemGroup(placement: .secondaryAction) {
                        CardFilterButton()
                        CardSortButton()
                    }
                }
            } else {
                CardList(
                    deck: deck,
                    deckView: true,
                    editCard: $editCard,
                    viewCard: .constant(false),
                    filterSphere: viewCardModel.filterSphere,
                    filterType: viewCardModel.filterType,
                    filterPack: [],
                    filterDeck: deck.slots.map{ String($0.key) },
                    sortParameter: viewCardModel.sortParameter,
                    sortOrder: viewCardModel.sortOrder,
                    searchText: viewCardModel.searchText
                )
                .navigationTitle($deck.name)
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItemGroup(placement: .topBarTrailing) {
                        DeckViewButton(viewCard: $viewCard)
                        DeckEditButton(editCard: $editCard)
                    }
                }
            }
        }
        .toolbar(.hidden, for: .bottomBar, .navigationBar)
    }
}

#Preview {
    ModelPreview { deck in
        DeckViewHome(deck: deck)
    }
    .modelContainer(previewModelContainer)
    .environment(ViewCardModel())
    .environment(ViewDeckModel())
}
