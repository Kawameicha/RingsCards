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
            PackList()
                .tabItem {
                    Label("Collection", systemImage: "greetingcard")
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
