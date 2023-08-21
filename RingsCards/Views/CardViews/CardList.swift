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

    var collectionOnly: [Card] {
        ringsData.cards.filter{ card in
            card.pack_code.contains("Core")
        }
    }

    var filteredCards: [Card] {
        guard !searchText.isEmpty else { return collectionOnly }
        return collectionOnly.filter { card in
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

struct CardList_Previews: PreviewProvider {
    static var previews: some View {
        CardList()
            .environmentObject(RingsData())
    }
}
