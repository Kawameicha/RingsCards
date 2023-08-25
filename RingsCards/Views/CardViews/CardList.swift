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
    
    var sortedCards: [Card] {
        collectionOnly.sorted(by: {
            if $0.type_code != $1.type_code {
                return $0.type_code < $1.type_code
            } else if $0.sphere_code != $1.sphere_code {
                return $0.sphere_code < $1.sphere_code
            } else {
                return $0.name < $1.name
            }
        })
    }

    var filteredCards: [Card] {
        guard !searchText.isEmpty else { return sortedCards }
        return sortedCards.filter { card in
            card.name.lowercased().contains(searchText.lowercased())
        }
    }

    var allTypes: [String] = ["Hero", "Ally", "Attachment", "Event"]

    var body: some View {
        NavigationView {
            List {
                ForEach(allTypes, id:\.self) { type in
                    Section(header: Text("\(type)")) {
                        ForEach(filteredCards.filter { card in
                            card.type_name.contains("\(type)")
                            
                        }) {card in
                            NavigationLink {
                                CardView(card: card)
                            } label: {
                                CardRow(card: card)
                            }
                        }
                    }
                }
            }
            .listStyle(.sidebar)
            .navigationTitle("Player Cards")
            .searchable(text: $searchText)
        }
    }
}

struct CardList_Previews: PreviewProvider {
    static var previews: some View {
        CardList()
            .environmentObject(RingsData())
    }
}
