//
//  PackRow.swift
//  RingsCards
//
//  Created by Christoph Freier on 08.10.23.
//

import SwiftUI
import SwiftData

struct PackRow: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var cards: [Card]
    @Bindable var packs: Pack

    var body: some View {
        Toggle("\(packs.packName)", systemImage: "\(packs.packPosition).square", isOn: $packs.isInCollection)
    }
}

#Preview {
    ModelPreview { pack in
        PackRow(packs: pack)
    }
    .modelContainer(previewModelContainer)
}
