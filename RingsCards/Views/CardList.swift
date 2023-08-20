//
//  CardList.swift
//  RingsCards
//
//  Created by Christoph Freier on 20.08.23.
//

import SwiftUI

struct Cards: View {
    var card: Card

    var body: some View {
        VStack(alignment: .leading, spacing: 3) {
            Text(card.name)
                .foregroundColor(.primary)
                .font(.headline)
            HStack(spacing: 3) {
                Label(card.sphere_name, systemImage: "person")
            }
            .foregroundColor(.secondary)
            .font(.subheadline)
        }
    }
}

struct CardList: View {
//    @State private var searchText: String = ""
//    @State private var cardId: Card.ID?
    
//    func filteredcards(
//        cards: [Card],
//        searchText: String
//    ) -> [Card] {
//        guard !searchText.isEmpty else { return cards }
//        return cards.filter { card in
//            card.name.lowercased().contains(searchText.lowercased())
//        }
//    }
    
    var body: some View {
        NavigationView {
            List(cards) { card in
                NavigationLink {
                    CardView(card: card)
                } label: {
                    Cards(card: card)
                }
            }
            .navigationTitle("Player Cards")
        }
//        .searchable(text: $searchText)
    }
}
