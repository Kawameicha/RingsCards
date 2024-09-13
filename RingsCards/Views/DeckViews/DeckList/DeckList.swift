//
//  DeckList.swift
//  RingsCards
//
//  Created by Christoph Freier on 28.08.23.
//

import SwiftUI
import SwiftData

struct DeckList: View {
    @Environment(ViewDeckModel.self) var viewDeckModel
    @Environment(\.modelContext) var modelContext
    @Query var decks: [Deck]
    @Query var campaigns: [Campaign]
    @Bindable var campaign: Campaign
    @State private var showConfirmDelete = false
    @State private var deckToDelete: Deck?
    var editDeck: Bool

    init(
        campaign: Campaign = Campaign.emptyCampaign,
        editDeck: Bool = false,

        sortDeckParameter: SortDeckParameter = .date_update,
        sortOrder: SortOrder = .reverse,
        searchText: String = ""
    ) {
        self.campaign = campaign
        self.editDeck = editDeck

        let predicate = Deck.predicate(
            searchText: searchText
        )
        switch sortDeckParameter {
        case .name: _decks = Query(filter: predicate, sort: \.name, order: sortOrder)
        case .date_update: _decks = Query(filter: predicate, sort: \.updated, order: sortOrder)
        case .date_creation: _decks = Query(filter: predicate, sort: \.created, order: sortOrder)
        }
    }

    var body: some View {
        @Bindable var viewDeckModel = viewDeckModel

        if campaign.code != "" && !editDeck {
            ForEach(campaign.decks) { deck in
                NavigationLink(value: Router.deckViewHome(deck: deck)) {
                    DeckRow(deck: deck)
                }
                .listRowBackground(
                    DeckHeroImages(heroes: Array(deck.heroes.keys).sorted())
                )
                .swipeActions(edge: .trailing) {
                    Button {
                        campaign.decks.remove(at: campaign.decks.lastIndex(of: deck) ?? 0)
                    } label: {
                        Label("Detach Deck", systemImage: "minus.circle")
                    }
                    .tint(.red)
                }
            }
            if campaign.decks.count <= 4 {
                NavigationLink(value: Router.deckList(campaign: campaign, editDeck: true)) {
                    Text("Attach a Deck")
                }
            }
        } else {
            List {
                if decks.isEmpty {
                    NavigationLink(value: Router.deckNew) {
                        Text("Create a Deck")
                    }
                } else {
                    ForEach(decks) { deck in
                        NavigationLink(value: Router.deckViewHome(deck: deck)) {
                            DeckRow(deck: deck)
                        }
                        .listRowBackground(
                            DeckHeroImages(heroes: Array(deck.heroes.keys).sorted())
                        )
                        .swipeActions(edge: .trailing) {
                            if editDeck {
                                Button {
                                    campaign.decks.insert(deck, at: campaign.decks.endIndex)
                                } label: {
                                    Label("Attach Deck", systemImage: "plus.circle")
                                }
                                .tint(.green)
                            }
                        }
                    }
                    .onDelete(perform: deleteItems)
                    .alert(isPresented: $showConfirmDelete) {
                        Alert(
                            title: Text("Confirm Delete"),
                            message: Text("This deck is associated with one or more campaigns. Do you want to proceed with deletion?"),
                            primaryButton: .destructive(Text("Delete")) {
                                if let deckToDelete = deckToDelete {
                                    deleteDeck(deckToDelete)
                                }
                            },
                            secondaryButton: .cancel()
                        )
                    }
                }
            }
            .listRowSpacing(10.0)
            .toolbar {
                ToolbarItemGroup(placement: .topBarTrailing) {
                    if !editDeck {
                        DeckSortButton()
                    }
                    DeckNewButton()
                }

                ToolbarItem(placement: .status) {
                    DeckInfo(count: decks.count)
                }
            }
        }
    }

    func deleteItems(offsets: IndexSet) {
        for index in offsets {
            let deck = decks[index]

            if let associatedCampaigns = deck.campaigns, !associatedCampaigns.isEmpty {
                deckToDelete = deck
                showConfirmDelete = true
            } else {
                deleteDeck(deck)
            }
        }
    }

    func deleteDeck(_ deck: Deck) {
        for campaign in campaigns {
            campaign.decks.removeAll(where: { $0 == deck })
        }
        modelContext.delete(deck)
    }
}

//#Preview {
//    ModelPreview { campaign in
//        DeckList(campaign: campaign, campaignView: false, campaignDeck: false)
//    }
//    .modelContainer(previewModelContainer)
//    .environment(ViewDeckModel())
//    .environment(ViewCardModel())
//}
