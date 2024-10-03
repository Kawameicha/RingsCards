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
    @Bindable var campaign: Campaign
    @Binding var editCard: Bool
    @Binding var editBoon: Bool

    init(
        deck: Deck = Deck.emptyDeck,
        campaign: Campaign = Campaign.emptyCampaign,
        editCard: Binding<Bool> = .constant(false),
        editBoon: Binding<Bool> = .constant(false),

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
        self.campaign = campaign
        self._editCard = editCard
        self._editBoon = editBoon

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

        if campaign.code != "" {
            if !editBoon {
                let cards = cards.filter { card in campaign.slots[card.code, default: 0] > 0 }

                ForEach(cards) { card in
                    NavigationLink {
                        CardVStack(cards: cards, card: card)
                    } label: {
                        CardRow(card: card, value: campaign.slots["\(card.code)", default: 0])
                    }
                }
            } else {
                ForEach(cards) { card in
                    NavigationLink {
                        CardVStack(cards: cards, card: card)
                    } label: {
                        CardRow(campaign: campaign, card: card, value: campaign.slots["\(card.code)", default: 0])
                    }
                }
            }
        } else if cards.isEmpty {
            ContentUnavailableView("No cards found", systemImage: "rectangle.portrait.on.rectangle.portrait.angled")
        } else {
            List {
                ForEach(CardType.allCases.filter { type in
                    cards.contains(where: { card in card.typeName.contains(type.rawValue.capitalized) })
                }, id: \.self) { type in
                    let typeName = type.rawValue.capitalized
                    Section(header: Text("\(typeName)")) {
                        ForEach(cards.filter { card in
                            card.typeName.contains("\(typeName)")
                        }) { card in
                            if editCard {
                                NavigationLink {
                                    CardVStack(cards: cards, deck: deck, card: card)
                                } label: {
                                    CardRow(deck: deck, card: card, value: deck.cardSlots["\(card.code)", default: 0])
                                }
                                .onAppear { if card == self.cards.last { viewCardModel.listOffset += 1 } }
                            } else {
                                NavigationLink {
                                    CardVStack(cards: cards, card: card)
                                    
                                } label: {
                                    CardRow(card: card, value: deck.cardSlots["\(card.code)", default: 0])
                                }
                                .onAppear { if card == self.cards.last { viewCardModel.listOffset += 1 } }
                            }
                        }
                    }
                }
            }
            .listStyle(.plain)
            .toolbar {
                if deck.code == -1 {
                    ToolbarItemGroup(placement: .topBarTrailing) {
                        CardSearchButton()
                        CardFilterButton()
                        CardSortButton()
                    }

                    ToolbarItem(placement: .status) {
                        CardInfo()
                    }
                } else {
                    ToolbarItem(placement: .status) {
                        DeckCardInfo(deck: deck)
                    }
                }
            }
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
