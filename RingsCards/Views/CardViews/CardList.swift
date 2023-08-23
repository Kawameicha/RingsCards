//
//  CardList.swift
//  RingsCards
//
//  Created by Christoph Freier on 20.08.23.
//

import SwiftUI

extension String {
    func within(_ strings: [String]) -> Bool {
        strings.contains { contains($0) }
    }
}

struct CardList: View {
    @EnvironmentObject var ringsData: RingsData
    @State private var searchText: String = ""

    var collection: [String] {
        ringsData.packs.map { pack in
            pack.inCollection ? pack.code : ""
        }
    }

    var collectionOnly: [Card] {
        ringsData.cards.filter { card in
            card.pack_code.within(collection)
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
