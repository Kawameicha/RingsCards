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
            filterSphere: filterSphere.rawValue,
            filterType: filterType.rawValue,
            filterPack: filterPack,
            filterDeck: filterDeck
        )
        var descriptor: FetchDescriptor<Card> {
            let limit = 100
            var sortBy: [SortDescriptor<Card>]

            switch sortParameter {
            case .code: sortBy = [SortDescriptor(\Card.cardCategory), SortDescriptor(\.code, order: sortOrder)]
            case .name: sortBy = [SortDescriptor(\Card.cardCategory), SortDescriptor(\.name, order: sortOrder)]
            case .cost: sortBy = [SortDescriptor(\Card.cardCategory), SortDescriptor(\.cost, order: sortOrder), SortDescriptor(\.threat, order: sortOrder)]
            case .sphere: sortBy = [SortDescriptor(\Card.cardCategory), SortDescriptor(\.sphere_code, order: sortOrder)]
            }

            var descriptor = FetchDescriptor<Card>(predicate: predicate, sortBy: sortBy)
            descriptor.fetchLimit = listOffset * limit
            return descriptor
        }
        _cards = Query(descriptor)
    }

    var body: some View {
        @Bindable var viewCardModel = viewCardModel

        if cards.isEmpty {
            ScrollView {
                Spacer(minLength: 200)
                    ContentUnavailableView("Refresh to load some cards", systemImage: "rectangle.portrait.on.rectangle.portrait.angled")
            }
        } else if !campaignView {
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
                            .onAppear { if card == self.cards.last { viewCardModel.listOffset += 1 } }
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

//                ToolbarItem(placement: .bottomBar) {
//                    CardInfo(deck: deck, count: cards.count)
//                }
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
                campaign.slots.map { String($0.key) }.contains(card.code)
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
//    ModelPreview { deck in
        ModelPreview { campaign in
            CardList(
//                deck: deck,
//                deckView: false,
                campaign: campaign
//                campaignView: false,
//                editCard: .constant(false),
//                viewCard: .constant(false),
//                editBoons: .constant(false)
            )
//        }
    }
    .modelContainer(previewModelContainer)
    .environment(ViewCardModel())
//    .environment(ViewDeckModel())
}
