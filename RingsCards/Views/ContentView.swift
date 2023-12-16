//
//  ContentView.swift
//  RingsCards
//
//  Created by Christoph Freier on 19.08.23.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(ViewCardModel.self) private var viewCardModel
    @Environment(ViewDeckModel.self) private var viewDeckModel
    @Environment(\.modelContext) private var modelContext
    @Query private var packs: [Pack]

    var collection: [String] {
        packs.map { pack in
            pack.isInCollection ? pack.packCode : ""
        }
    }

    var body: some View {
        TabView {
            CardList(
                filterSphere: viewCardModel.filterSphere,
                filterType: viewCardModel.filterType,
                filterPack: collection,
//                   filterDeck: viewCardModel.filterDeck,
                sortParameter: viewCardModel.sortParameter,
                sortOrder: viewCardModel.sortOrder,
                searchText: viewCardModel.searchText
            )
                .tabItem {
                    Label("Cards", systemImage: "rectangle.portrait.fill")
            }
            DeckList(
                sortDeckParameter: viewDeckModel.sortDeckParameter,
                sortOrder: viewDeckModel.sortOrder,
                searchText: viewDeckModel.searchText
            )
                .tabItem {
                    Label("Decks", systemImage: "person.3.fill")
            }
            CampaignList()
                .tabItem {
                    Label("Campaigns", systemImage: "book.fill")
            }
            SettingView()
                .tabItem {
                    Label("Settings", systemImage: "slider.horizontal.3")
            }
        }
    }
}

#Preview {
    ContentView()
        .environmentObject(RingsData())
        .modelContainer(previewModelContainer)
        .environment(ViewCardModel())
        .environment(ViewDeckModel())
}
