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
    @Query(filter: #Predicate<Pack> { pack in
        pack.isInCollection }) var packs: [Pack]
    @Query var cards: [Card]
    @Bindable var deck: Deck
    var deckView: Bool
    @Bindable var campaign: Campaign
    var campaignView: Bool
    @Binding var editCard: Bool
    @Binding var viewCard: Bool
    @Binding var editBoons: Bool

    init(
        deck: Deck = Deck.emptyDeck,
        deckView: Bool = false,
        campaign: Campaign = Campaign.emptyCampaign,
        campaignView: Bool = false,
        editCard: Binding<Bool> = .constant(false),
        viewCard: Binding<Bool> = .constant(false),
        editBoons: Binding<Bool> = .constant(false),

        filterSphere: FilterSphere = .all,
        filterType: FilterType = .any,
        filterPack: [String] = [],
        filterDeck: [String] = [],
        sortParameter: SortParameter = .name,
        sortOrder: SortOrder = .forward,
        searchText: String = "",
        searchBy: SearchParameter = .name,
        listOffset: Int = 1
    ) {
        self.deck = deck
        self.deckView = deckView
        self.campaign = campaign
        self.campaignView = campaignView
        self._editCard = editCard
        self._viewCard = viewCard
        self._editBoons = editBoons

        let predicate = Card.predicate(
            searchText: searchText,
            searchBy: searchBy,
            filterSphere: filterSphere.rawValue,
            filterType: filterType.rawValue,
            filterPack: filterPack,
            filterDeck: filterDeck
        )
        var descriptor: FetchDescriptor<Card> {
            let limit = 100
            var sortBy: [SortDescriptor<Card>]

            switch sortParameter {
            case .code: sortBy = [SortDescriptor(\Card.cardSort), SortDescriptor(\.code, order: sortOrder)]
            case .name: sortBy = [SortDescriptor(\Card.cardSort), SortDescriptor(\.name, order: sortOrder)]
            case .cost: sortBy = [SortDescriptor(\Card.cardSort), SortDescriptor(\.costs.cost, order: sortOrder), SortDescriptor(\.costs.threat, order: sortOrder)]
            case .sphere: sortBy = [SortDescriptor(\Card.cardSort), SortDescriptor(\.sphereCode, order: sortOrder), SortDescriptor(\.name, order: sortOrder)]
            }

            var descriptor = FetchDescriptor<Card>(predicate: predicate, sortBy: sortBy)
            descriptor.fetchLimit = listOffset * limit
            return descriptor
        }
        _cards = Query(descriptor)
    }

    
    var body: some View {
        @Bindable var viewCardModel = viewCardModel
        let count = (try? modelContext.fetchCount(FetchDescriptor<Card>(predicate: Card.predicate(
            searchText: viewCardModel.searchText,
            searchBy: viewCardModel.searchBy,
            filterSphere: viewCardModel.filterSphere.rawValue,
            filterType: viewCardModel.filterType.rawValue,
            filterPack: packs.map { $0.packCode },
            filterDeck: viewCardModel.filterDeck
        )))) ?? 0

        if !campaignView {
            List {
                ForEach(CardType.allCases.map { $0.rawValue.capitalized }, id:\.self) { type in
                    Section(header: Text("\(type)")) {
                        ForEach(cards.filter { card in
                            card.typeName.contains("\(type)")
                        }) { card in
                            NavigationLink {
                                CardVStack(cards: cards, card: card)
                            } label: {
                                if editCard {
                                    DeckCardEdit(deck: deck, card: card, value: deck.cardSlots["\(card.code)", default: 0])
                                } else {
                                    CardRow(card: card, value: deck.cardSlots["\(card.code)", default: 0])
                                }
                            }
                            .onAppear { if card == self.cards.last { viewCardModel.listOffset += 1 } }
                        }
                    }
                }
            }
            .toolbar {
                if !deckView {
                    ToolbarItemGroup(placement: .topBarTrailing) {
                        CardSearchButton()
                        CardFilterButton()
                        CardSortButton()
                    }

                    ToolbarItem(placement: .status) {
                        CardInfo(count: count)
                    }
                } else {
                    ToolbarItem(placement: .status) {
                        DeckCardInfo(deck: deck)
                    }
                }
            }
        } else if !editBoons {
            ForEach(cards.filter { card in
                campaign.slots[card.code, default: 0] > 0
            }) { card in
                NavigationLink {
                    CardVStack(cards: cards.filter { card in
                        campaign.slots[card.code, default: 0] > 0
                    }, card: card)
                } label: {
                    CardRow(card: card, value: campaign.slots["\(card.code)", default: 0])
                }
            }
        } else {
            ForEach(cards) { card in
                NavigationLink {
                    CardVStack(cards: cards, card: card)
                } label: {
                    CampaignCardEdit(campaign: campaign, card: card, value: campaign.slots["\(card.code)", default: 0])
                }
            }
//            .onAppear {
//                viewCardModel.listOffset = 1
//            }
//            .onDisappear {
//                viewCardModel.listOffset = 1
//            }
        }
    }
}

//#Preview {
//    ModelPreview { campaign in
//        CardList(
//            campaign: campaign
//        )
//    }
//    .modelContainer(previewModelContainer)
//    .environment(ViewCardModel())
//}
