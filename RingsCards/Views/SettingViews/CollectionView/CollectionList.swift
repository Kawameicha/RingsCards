//
//  CollectionList.swift
//  RingsCards
//
//  Created by Christoph Freier on 08.10.23.
//

import SwiftUI
import SwiftData

struct CollectionList: View {
    @Environment(\.modelContext) private var modelContext
    @Query(sort: \Collection.packPosition) private var collection: [Collection]

    let allCycles: [String] = ["Shadows of Mirkwood", "Dwarrowdelf", "Against the Shadow", "The Ring-maker", "Angmar Awakened",
    "Dream-chaser", "Haradrim", "Ered Mithrin", "Vengeance of Mordor"]

    var body: some View {
        NavigationView {
            List {
                ForEach(allCycles, id:\.self) { cycle in
                    Section(header: Text("\(cycle)")) {
                        ForEach(collection.filter { pack in
                            pack.cycleName.contains("\(cycle)")
                        }) { pack in
                            CollectionRow(collection: pack)
                        }
                    }
                }
            }
            .navigationTitle("My Collection")
        }
    }
}

#Preview {
    CollectionList()
        .modelContainer(previewModelContainer)
}
