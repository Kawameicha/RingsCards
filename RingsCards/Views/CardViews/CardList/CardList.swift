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

    @Bindable private var deck: Deck
    @Bindable private var campaign: Campaign
    
    @Binding private var editCard: Bool
    @Binding private var viewCard: Bool
    @Binding private var editBoons: Bool
    
    private var deckView: Bool
    private var campaignView: Bool
    
    private var filterPack: [String]
    private var filterDeck: [String]
    private var sortParameter: SortParameter?
    
    init(
        deck: Deck = Deck.emptyDeck,
        deckView: Bool = false,
        campaign: Campaign = Campaign.emptyCampaign,
        campaignView: Bool = false,
        editCard: Binding<Bool> = .constant(false),
        viewCard: Binding<Bool> = .constant(false),
        editBoons: Binding<Bool> = .constant(false),
        filterPack: [String] = [],
        filterDeck: [String] = [],
        sortParameter: SortParameter? = nil
    ) {
        self.deck = deck
        self.deckView = deckView
        self.campaign = campaign
        self.campaignView = campaignView
        self.filterPack = filterPack
        self.filterDeck = filterDeck
        self.sortParameter = sortParameter
        self._editCard = editCard
        self._viewCard = viewCard
        self._editBoons = editBoons
    }

    var body: some View {
        @Bindable var viewCardModel = viewCardModel
        
        CardListView(deck: deck,
                     campaign: campaign,
                     campaignView: campaignView,
                     deckView: deckView,
                     editCard: $editCard,
                     editBoons: $editBoons,
                     filterSphere: viewCardModel.filterSphere,
                     filterType: viewCardModel.filterType,
                     filterPack: filterPack,
                     filterDeck: filterDeck,
                     sortParameter: sortParameter ?? viewCardModel.sortParameter,
                     sortOrder: viewCardModel.sortOrder,
                     searchText: viewCardModel.searchText,
                     listOffset: viewCardModel.listOffset)
    }
}

private struct CardListView: View {
    @Environment(ViewCardModel.self) private var viewCardModel
    @Query private var cards: [Card]
    
    @Bindable private var deck: Deck
    @Bindable private var campaign: Campaign
    
    @Binding private var editCard: Bool
    @Binding private var editBoons: Bool
    
    private var campaignView: Bool
    private var deckView: Bool
    
    init(deck: Deck,
         campaign: Campaign,
         campaignView: Bool,
         deckView: Bool,
         editCard: Binding<Bool>,
         editBoons: Binding<Bool>,
         filterSphere: FilterSphere,
         filterType: FilterType,
         filterPack: [String] = [],
         filterDeck: [String] = [],
         sortParameter: SortParameter,
         sortOrder: SortOrder,
         searchText: String,
         listOffset: Int) {
        self.deck = deck
        self.campaign = campaign
        self.campaignView = campaignView
        self.deckView = deckView
        self._editCard = editCard
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
        
        self._cards = Query(descriptor)
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
                            NavigationLink(value: Router.cardView(card)) {
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
            .searchable(text: $viewCardModel.searchText)
            .disableAutocorrection(true)
            .toolbar {
                if !deckView {
                    ToolbarItemGroup(placement: .topBarTrailing) {
                        CardFilterButton()
                        CardSortButton()
                    }
                }
            }
        } else if !editBoons {
            ForEach(cards.filter { card in
                campaign.slots.filter { $1 > 0 }.map { $0.key }.contains(card.code)
            }) { card in
                NavigationLink(value: Router.cardView(card)) {
                    CardRow(card: card, value: campaign.slots["\(card.code)", default: 0])
                }
            }
        } else {
            ForEach(cards.filter { card in
                campaign.slots.map { String($0.key) }.contains(card.code)
            }) { card in
                NavigationLink(value: Router.cardView(card)) {
                    CampaignCardEdit(campaign: campaign, card: card, value: campaign.slots["\(card.code)", default: 0])
                }
            }
        }
    }
}

#Preview {
    ModelPreview { campaign in
        CardList(
            campaign: campaign
        )
    }
    .modelContainer(previewModelContainer)
    .environment(ViewCardModel())
}
