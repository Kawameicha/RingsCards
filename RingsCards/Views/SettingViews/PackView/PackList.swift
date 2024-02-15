//
//  PackList.swift
//  RingsCards
//
//  Created by Christoph Freier on 08.10.23.
//

import SwiftUI
import SwiftData

struct PackList: View {
    @Environment(ViewCardModel.self) var viewCardModel
    @Environment(\.modelContext) private var modelContext
    @Query(sort: \Pack.packPosition) private var packs: [Pack]

    let allCycles: [String] = [
        "Shadows of Mirkwood",
        "Dwarrowdelf",
        "Against the Shadow",
        "The Ring-maker",
        "Angmar Awakened",
        "Dream-chaser",
        "Haradrim",
        "Ered Mithrin",
        "Vengeance of Mordor",
        "Oaths of the Rohirrim",
        "The Hobbit",
        "The Lord of the Rings",
        "Starter Decks",
        "Scenario Packs"
    ]

    var body: some View {
        @Bindable var viewCardModel = viewCardModel

        List {
            ForEach(allCycles, id:\.self) { cycle in
                Section(header: Text("\(cycle)")) {
                    ForEach(packs.filter { pack in
                        pack.cycleName.contains("\(cycle)")
                    }) { pack in
                        NavigationLink {
                            CardList(
                                filterSphere: .all,
                                filterType: .any,
                                filterPack: [pack.packCode],
                                filterDeck: [],
                                sortParameter: SortParameter.code,
                                sortOrder: SortOrder.forward,
                                searchText: ""
                            )
                        } label: {
                            PackRow(packs: pack)
                        }
                    }
                }
            }
        }
        .navigationTitle("My Collection")
    }
}

#Preview {
    PackList()
        .modelContainer(previewModelContainer)
        .environment(ViewCardModel())
}
