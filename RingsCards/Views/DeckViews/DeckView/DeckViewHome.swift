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
    @State var showStat = false
    @State var campaign = false
    @Bindable var deck: Deck

    var body: some View {
        @Bindable var viewCardModel = viewCardModel

        if viewCard {
            CardList(
                deck: deck,
                editCard: .constant(true),
                filterSphere: viewCardModel.filterSphere,
                filterType: viewCardModel.filterType,
                filterPack: packs.map { $0.packCode },
                filterDeck: [],
                sortParameter: viewCardModel.sortParameter,
                sortOrder: viewCardModel.sortOrder,
                searchText: viewCardModel.searchText,
                searchBy : viewCardModel.searchBy,
                listOffset: viewCardModel.listOffset
            )
            .navigationTitle($deck.name)
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarBackButtonHidden()
            .searchable(text: $viewCardModel.searchText)
            .disableAutocorrection(true)
            .toolbar {
                ToolbarItemGroup(placement: .confirmationAction) {
                    DeckViewButton(viewCard: $viewCard)
                }

                ToolbarItemGroup(placement: .topBarTrailing) {
                    CardSearchButton()
                    CardFilterButton()
                    CardSortButton()
                }
            }
        } else {
            CardList(
                deck: deck,
                editCard: $editCard,
                filterPack: [],
                filterDeck: deck.cardSlots.map { String($0.key) }
            )
            .navigationTitle($deck.name)
            .toolbar {
                ToolbarItemGroup(placement: .confirmationAction) {
                    if !editCard {
                        DeckViewButton(viewCard: $viewCard)
                    } else {
                        DeckEditButton(editCard: $editCard)
                    }
                }

                ToolbarItemGroup(placement: .secondaryAction) {
                    DeckViewButton(viewCard: $viewCard)
                    if deck.cardSlots.count > 1 {
                        DeckEditButton(editCard: $editCard)
                    }
                    DeckCampaignButton(campaign: $campaign)
                    DeckStatButton(showStat: $showStat)
                }
            }
            .sheet(isPresented: $showStat) {
                DeckChartVStack(deck: deck)
                    .presentationDetents([.medium])
            }
            .sheet(isPresented: $campaign) {
                DeckCampaignList(deck: deck)
                    .presentationDetents([.medium])
            }
        }
    }
}

//#Preview {
//    ModelPreview { deck in
//        DeckViewHome(deck: deck)
//    }
//    .modelContainer(previewModelContainer)
//    .environment(ViewCardModel())
//    .environment(ViewDeckModel())
//}
