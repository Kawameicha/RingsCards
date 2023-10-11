//
//  CollectionRow.swift
//  RingsCards
//
//  Created by Christoph Freier on 08.10.23.
//

import SwiftUI
import SwiftData

struct CollectionRow: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var cards: [Card]
    @Bindable var collection: Collection

    var body: some View {
        Toggle("\(collection.packName)", systemImage: "\(collection.packPosition).square", isOn: $collection.isInCollection)
            .onChange(of: collection.isInCollection) {
                for card in cards.filter({ card in
                    card.pack_code == collection.packCode
                }) { card.isInCollection.toggle() }
            }
    }
}

#Preview {
    ModelPreview { collection in
        CollectionRow(collection: collection)
    }
    .modelContainer(previewModelContainer)
}
