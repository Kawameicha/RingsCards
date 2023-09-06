//
//  ContentView.swift
//  RingsCards
//
//  Created by Christoph Freier on 19.08.23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            CardList()
                .tabItem {
                    Label("Cards", systemImage: "rectangle.portrait.fill")
            }
            DeckList()
                .tabItem {
                    Label("Decks", systemImage: "person.3.fill")
            }
            CampaignList()
                .tabItem {
                    Label("Campaign", systemImage: "book.fill")
            }
            SettingView()
                .tabItem {
                    Label("Settings", systemImage: "slider.horizontal.3")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(RingsData())
    }
}
