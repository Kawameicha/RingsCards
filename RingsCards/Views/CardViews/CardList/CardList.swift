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
    var deckView = false
    @Bindable var campaign: Campaign
    var campaignView = false
    @Binding var editCard: Bool
    @Binding var viewCard: Bool
    @Binding var editBoons: Bool

    init(
        deck: Deck,
        deckView: Bool,
        campaign: Campaign,
        campaignView: Bool,
        editCard: Binding<Bool>,
        viewCard: Binding<Bool>,
        editBoons: Binding<Bool>,

        filterSphere: FilterSphere = .all,
        filterType: FilterType = .Hero,
        filterPack: [String] = [],
        filterDeck: [String] = [],
        sortParameter: SortParameter = .name,
        sortOrder: SortOrder = .forward,
        searchText: String = ""
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

        if !campaignView {
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
                                    DeckCardEdit(deck: deck, card: card, value: deck.slots["\(card.code)", default: 0])
                                } else {
                                    CardRow(card: card, value: deck.slots["\(card.code)", default: 0])
                                }
                            }
                        }
                    }
                }
            }
            .toolbar {
                if !deckView {
                    ToolbarItemGroup(placement: .topBarTrailing) {
                        CardFilterButton()
                        CardSortButton()
                    }
                }

                ToolbarItem(placement: .bottomBar) {
                    CardInfo(count: cards.count, deck: deck)
                }
            }
        } else if !editBoons {
            ForEach(cards.filter { card in
                campaign.slots.filter { $1 > 0 }.map { $0.key }.contains(card.code)
            }) { card in
                NavigationLink {
                    CardView(card: card)
                } label: {
                    CardRow(card: card, value: campaign.slots["\(card.code)", default: 0])
                }
            }
        } else {
            ForEach(cards.filter { card in
                campaign.slots.map{ String($0.key) }.contains(card.code)
            }) { card in
                NavigationLink {
                    CardView(card: card)
                } label: {
                    CampaignCardEdit(campaign: campaign, card: card, value: campaign.slots["\(card.code)", default: 0])
                }
            }
        }
    }
}

#Preview {
    ModelPreview { deck in
        ModelPreview { campaign in
            CardList(
                deck: deck,
                deckView: false,
                campaign: campaign,
                campaignView: false,
                editCard: .constant(false),
                viewCard: .constant(false),
                editBoons: .constant(false))
        }
    }
    .modelContainer(previewModelContainer)
    .environment(ViewCardModel())
    .environment(ViewDeckModel())
}
