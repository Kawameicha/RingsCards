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
    @State var cardList = false

    var body: some View {
        @Bindable var viewCardModel = viewCardModel

        NavigationView {
            if cardList {
                CardList(
                    deck: Deck.emptyDeck,
                    deckView: false,
                    campaign: Campaign.emptyCampaign,
                    campaignView: false,
                    editCard: .constant(false),
                    viewCard: .constant(false),
                    editBoons: .constant(false),
                    filterSphere: viewCardModel.filterSphere,
                    filterType: viewCardModel.filterType,
                    filterPack: packs.map { $0.packCode },
                    filterDeck: [],
                    sortParameter: viewCardModel.sortParameter,
                    sortOrder: viewCardModel.sortOrder,
                    searchText: viewCardModel.searchText,
                    offset: viewCardModel.offset
                )
                .refreshable {
                    await CardResponse.refresh(modelContext: modelContext, packs: packs)
                }
                .navigationTitle("Player Cards")
                .searchable(text: $viewCardModel.searchText)
            }
        }
        .onAppear {
            cardList = true
        }
        .onDisappear {
            cardList = false
            viewCardModel.offset = 1
        }
    }
}

#Preview {
    CardHome()
        .modelContainer(previewModelContainer)
        .environment(ViewCardModel())
        .environment(ViewDeckModel())
}
