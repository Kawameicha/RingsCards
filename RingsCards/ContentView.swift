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
            CardView()
                .tabItem {
                    Label("Cards", systemImage: "magnifyingglass")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
