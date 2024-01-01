//
//  CardHome.swift
//  RingsCards
//
//  Created by Christoph Freier on 20.08.23.
//

import SwiftUI
import SwiftData

struct CardHome: View {
    @Environment(ViewCardModel.self) var viewCardModel
    @Environment(\.modelContext) var modelContext
    @Query(filter: #Predicate<Pack> { pack in
        pack.isInCollection }) var packs: [Pack]

    var body: some View {
        @Bindable var viewCardModel = viewCardModel

        NavigationView {
            CardList(
                deck: Deck.emptyDeck,
                editCard: .constant(false),
                viewCard: .constant(false),
                filterSphere: viewCardModel.filterSphere,
                filterType: viewCardModel.filterType,
                filterPack: packs.map { $0.packCode },
                filterDeck: [],
                sortParameter: viewCardModel.sortParameter,
                sortOrder: viewCardModel.sortOrder,
                searchText: viewCardModel.searchText
            )
            .refreshable {
                await CardResponse.refresh(modelContext: modelContext, packs: packs)
            }
            .navigationTitle("Player Cards")
            .searchable(text: $viewCardModel.searchText)
        }
    }
}

#Preview {
    CardHome()
        .modelContainer(previewModelContainer)
        .environment(ViewCardModel())
        .environment(ViewDeckModel())
}
