//
//  CardList.swift
//  RingsCards
//
//  Created by Christoph Freier on 20.08.23.
//

import SwiftUI

struct CardList: View {
    @EnvironmentObject var ringsData: RingsData
    @State private var searchText: String = ""
    
    var filteredCards: [Card] {
        guard !searchText.isEmpty else { return ringsData.cards }
        return ringsData.cards.filter { card in
            card.name.lowercased().contains(searchText.lowercased())
        }
    }
    
    var body: some View {
        NavigationView {
            List(filteredCards) { card in
                NavigationLink {
                    CardView(card: card)
                } label: {
                    CardRow(card: card)
                }
            }
            .navigationTitle("Player Cards")
        }
        .searchable(text: $searchText)
    }
}
