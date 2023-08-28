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
                    Label("Cards", systemImage: "magnifyingglass")
            }
            DeckList()
                .tabItem {
                    Label("Decks", systemImage: "person.3")
            }
            ScenarioList()
                .tabItem {
                    Label("Scenarios", systemImage: "book")
            }
            PackList()
                .tabItem {
                    Label("Packs", systemImage: "greetingcard")
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
