//
//  ContentView.swift
//  RingsCards
//
//  Created by Christoph Freier on 19.08.23.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(ViewCampaignModel.self) var viewCampaignModel
    @Environment(\.modelContext) var modelContext

    var body: some View {
        TabView {
            CardHome()
                .tabItem {
                    Label("Cards", systemImage: "rectangle.portrait.fill")
                }
            DeckHome()
                .tabItem {
                    Label("Decks", systemImage: "person.3.fill")
                }
            CampaignList(
                sortCampaignParameter: viewCampaignModel.sortCampaignParameter,
                sortOrder: viewCampaignModel.sortOrder,
                searchText: viewCampaignModel.searchText
            )
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
        .environment(ViewCampaignModel())
}
