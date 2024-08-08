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
    @Bindable var campaign: Campaign
    @State private var cannotDelete = false
    var editDeck: Bool

    init(
        campaign: Campaign = Campaign.emptyCampaign,
        editDeck: Bool = false,

        sortDeckParameter: SortDeckParameter = .name,
        sortOrder: SortOrder = .forward,
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
                NavigationLink {
                    DeckList(
                        sortDeckParameter: viewDeckModel.sortDeckParameter,
                        sortOrder: viewDeckModel.sortOrder,
                        searchText: viewDeckModel.searchText
                    )
                    .searchable(text: $viewDeckModel.searchText)
                    .disableAutocorrection(true)
                } label: {
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
                    .alert(isPresented:$cannotDelete) {
                        Alert(
                            title: Text("This deck is used in one or more campaigns."),
                            message: Text("It cannot be deleted for the moment.")
                        )
                    }
                }
            }
            .listRowSpacing(10.0)
            .toolbar {
                ToolbarItemGroup(placement: .topBarTrailing) {
                    DeckSortButton()
                    DeckNewButton()
                }

                ToolbarItem(placement: .status) {
                    DeckInfo(count: decks.count)
                }
            }
            .searchable(text: $viewDeckModel.searchText)
            .disableAutocorrection(true)
        }
    }

    func deleteItems(offsets: IndexSet) {
        for index in offsets {
            if decks[index].campaigns?.count ?? 0 > 0 {
                cannotDelete = true
            } else {
                modelContext.delete(decks[index])
            }
        }
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
