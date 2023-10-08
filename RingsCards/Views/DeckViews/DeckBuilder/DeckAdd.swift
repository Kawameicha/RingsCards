//
//  DeckAdd.swift
//  RingsCards
//
//  Created by Christoph Freier on 25.09.23.
//

import SwiftUI
import SwiftData

struct DeckAdd: View {
    @Environment(\.modelContext) private var modelContext
    @Query(sort: \Card.name, order: .reverse) private var cards: [Card]

    @EnvironmentObject var ringsData: RingsData
    @State private var searchText: String = ""
    @State private var sortBySphere = false
    @State private var showFilters = false
    @State private var showCollection = false

    var deck: Deck
    var value = 0

//    var collection: [String] {
//        ringsData.collection.map { pack in
//            pack.isInCollection ? pack.PackCode : ""
//        }
//    }
//
//    var collectionOnly: [Card] {
//        cards.filter { card in
//            card.pack_code.within(collection)
//        }
//    }

    var filtered: [String] {
        ringsData.spheres.map { sphere in
            sphere.filterIn ? sphere.name : ""
        }
    }

    var filteredCards: [Card] {
        cards.filter { card in
            card.sphere_name.within(filtered)
        }
    }

    var sortedCards: [Card] {
        filteredCards.sorted(by: {
            if sortBySphere == true && $0.sphere_code != $1.sphere_code {
                return $0.sphere_code < $1.sphere_code
            } else {
                return $0.name < $1.name
            }
        })
    }

    var searchedCards: [Card] {
        guard !searchText.isEmpty else { return sortedCards }
        return sortedCards.filter { card in
            card.name.lowercased().cleaned().contains(searchText.lowercased())
        }
    }

    var allKeys: [String] { deck.slots.map{String($0.key) } }

    var body: some View {
        NavigationView {
            List {
                ForEach(CardAnatomy.CardType.allCases.map { $0.rawValue.capitalized }, id:\.self) { type in
                    Section(header: Text("Add \(type)")) {
                        ForEach(searchedCards.filter { card in
                            !card.code.within(allKeys) && card.type_name.contains("\(type)")
                        }) {card in
                            NavigationLink {
                                CardView(card: card)
                            } label: {
                                DeckEdit(deck: deck, card: card)
                            }
                        }
                    }
                }
            }
            .listStyle(.sidebar)
            .navigationTitle("Add Cards")
            .searchable(text: $searchText)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Menu(content: {
                        Button {
                            sortBySphere.toggle()
                        } label: {
                            Label("Sort by Sphere", systemImage: "arrow.up.arrow.down")
                        }
                        Button {
                            showFilters.toggle()
                        } label: {
                            Label("Show Filters", systemImage: "line.3.horizontal.decrease")
                        }
                        Button {
                            showCollection.toggle()
                        } label: {
                            Label("Edit Collection", systemImage: "checklist")
                        }
                    }) {
                        Image(systemName: "ellipsis.circle")
                    }
                }
            }
//            .sheet(isPresented: $showCollection) {
//                CollectionView()
//                    .environmentObject(ringsData)
//                    .presentationDetents([.medium, .large])
//            }
            .sheet(isPresented: $showFilters) {
                FilterEdit()
                    .environmentObject(ringsData)
                    .presentationDetents([.medium, .large])
            }
        }
    }
}

#Preview {
    ModelPreview { deck in
        DeckAdd(deck: deck)
    }
    .modelContainer(previewModelContainer)
    .environmentObject(RingsData())
}
