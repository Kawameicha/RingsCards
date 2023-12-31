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
    @Bindable var deck: Deck

    var body: some View {
        NavigationView {
            if viewCard {
                CardList(
                    deck: deck,
                    editCard: .constant(true),
                    viewCard: $viewCard,
                    filterSphere: viewCardModel.filterSphere,
                    filterType: viewCardModel.filterType,
                    filterPack: packs.map { $0.packCode },
                    filterDeck: [],
                    sortParameter: viewCardModel.sortParameter,
                    sortOrder: viewCardModel.sortOrder,
                    searchText: viewCardModel.searchText
                )
                .navigationTitle($deck.name)
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem(placement: .bottomBar) {
                        DeckCardInfo(deck: deck)
                    }

                    ToolbarTitleMenu {
                        Button {
                            viewCard.toggle()
                        } label: {
                            Label("Add Card", systemImage: "plus.rectangle.portrait")
                        }

                        Button {
                            editCard.toggle()
                        } label: {
                            Label("Edit Deck", systemImage: "plus.forwardslash.minus")
                        }

                        RenameButton()
                    }
                }
            } else {
                CardList(
                    deck: deck,
                    editCard: $editCard,
                    viewCard: .constant(false),
                    filterSphere: viewCardModel.filterSphere,
                    filterType: viewCardModel.filterType,
                    filterPack: [],
                    filterDeck: deck.slots.map{ String($0.key) },
                    sortParameter: viewCardModel.sortParameter,
                    sortOrder: viewCardModel.sortOrder,
                    searchText: viewCardModel.searchText
                )
                .navigationTitle($deck.name)
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem(placement: .bottomBar) {
                        DeckCardInfo(deck: deck)
                    }

                    ToolbarTitleMenu {
                        Button {
                            viewCard.toggle()
                        } label: {
                            Label("Add Card", systemImage: "plus.rectangle.portrait")
                        }

                        Button {
                            editCard.toggle()
                        } label: {
                            Label("Edit Deck", systemImage: "plus.forwardslash.minus")
                        }

                        RenameButton()
                    }
                }
            }
        }
    }
}

#Preview {
    ModelPreview { deck in
        DeckViewHome(deck: deck)
    }
    .modelContainer(previewModelContainer)
    .environment(ViewCardModel())
    .environment(ViewDeckModel())
}
