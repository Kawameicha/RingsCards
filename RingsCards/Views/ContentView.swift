//
//  ContentView.swift
//  RingsCards
//
//  Created by Christoph Freier on 19.08.23.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(ViewModel.self) private var viewModel
    @Environment(\.modelContext) private var modelContext
    @Query private var packs: [Pack]

    var collection: [String] {
        packs.map { pack in
            pack.isInCollection ? pack.packCode : ""
        }
    }

    var body: some View {
        TabView {
            CardList(filterSphere: viewModel.filterSphere,
                     filterType: viewModel.filterType,
                     filterPack: collection,
//                     filterDeck: viewModel.filterDeck,
                     sortParameter: viewModel.sortParameter,
                     sortOrder: viewModel.sortOrder,
                     searchText: viewModel.searchText)
                .tabItem {
                    Label("Cards", systemImage: "rectangle.portrait.fill")
            }
            DeckList()
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
        .environment(ViewModel())
        .modelContainer(previewModelContainer)
}
