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
    var campaignView = false
    var campaignDeck = false
    @State private var confirmDelete = false

    init(
        campaign: Campaign,
        campaignView: Bool,
        campaignDeck: Bool,

        sortDeckParameter: SortDeckParameter = .name,
        sortOrder: SortOrder = .forward,
        searchText: String = ""
    ) {
        self.campaign = campaign
        self.campaignView = campaignView
        self.campaignDeck = campaignDeck

        let predicate = Deck.predicate(
            searchText: searchText
        )
        switch sortDeckParameter {
        case .name: _decks = Query(filter: predicate, sort: \.name, order: sortOrder)
        case .date_update: _decks = Query(filter: predicate, sort: \.date_update, order: sortOrder)
        case .date_creation: _decks = Query(filter: predicate, sort: \.date_creation, order: sortOrder)
        }
    }

    var body: some View {
        @Bindable var viewDeckModel = viewDeckModel

        if campaignView {
            let campaignDecks = campaign.decks ?? [Deck.emptyDeck]

            ForEach(campaignDecks) { deck in
                NavigationLink(value: Router.deckViewHome(deck: deck)) {
                    DeckRow(deck: deck)
                }
                .swipeActions(edge: .trailing) {
                    Button {
                        campaign.decks?.remove(at: campaign.decks?.lastIndex(of: deck) ?? 0)
                    } label: {
                        Label("Detach Deck", systemImage: "minus.circle")
                    }
                    .tint(.red)
                }
            }
            if campaignDecks.count <= 4 {
                NavigationLink(value: Router.deckList(campaign: campaign, campaignView: false, campaignDeck: true)) {
                    Text("Attach a Deck")
                }
            }
        } else if campaignDeck {
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
                        .swipeActions(edge: .trailing) {
                            Button {
                                campaign.decks?.insert(deck, at: campaign.decks?.endIndex ?? 0)
                            } label: {
                                Label("Attach Deck", systemImage: "plus.circle")
                            }
                            .tint(.green)
                        }
                    }
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
//                        .swipeActions(edge: .trailing) {
//                            Button {
//                                if deck.campaigns?.count ?? 0 > 0 {
//                                    confirmDelete = true
//                                } else {
//                                    modelContext.delete(deck)
//                                }
//                            } label: {
//                                Label("Delete Deck", systemImage: "trash")
//                            }
//                            .tint(.red)
//                        }
//                        .alert(isPresented:$confirmDelete) {
//                            Alert(
//                                title: Text("Are you sure you want to delete this deck?"),
//                                message: Text("This deck is used in one or more campaigns."),
//                                primaryButton: .destructive(Text("Delete")) {
//                                    modelContext.delete(deck)
//                                },
//                                secondaryButton: .cancel()
//                            )
//                        }
                    }
                    .onDelete(perform: deleteItems)
                    .alert(isPresented:$confirmDelete) {
                        Alert(
                            title: Text("This deck is used in one or more campaigns."),
                            message: Text("It cannot be deleted for the moment.")
                        )
                    }
                }
            }
            .toolbar {
                ToolbarItemGroup(placement: .topBarTrailing) {
                    DeckSortButton()
                    DeckNewButton()
                }

                ToolbarItem(placement: .principal) {
                    DeckInfo(count: decks.count)
                }
            }
        }
    }

    func deleteItems(offsets: IndexSet) {
        for index in offsets {
            if decks[index].campaigns?.count ?? 0 > 0 {
                confirmDelete = true
            } else {
                modelContext.delete(decks[index])
            }
        }
    }
}

#Preview {
    ModelPreview { campaign in
        DeckList(campaign: campaign, campaignView: false, campaignDeck: false)
    }
    .modelContainer(previewModelContainer)
    .environment(ViewDeckModel())
    .environment(ViewCardModel())
}
