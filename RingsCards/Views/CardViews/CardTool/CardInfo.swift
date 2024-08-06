//
//  CardInfo.swift
//  RingsCards
//
//  Created by Christoph Freier on 29.09.23.
//

import SwiftUI
import SwiftData

struct CardInfo: View {
    @Environment(ViewCardModel.self) var viewCardModel
    @Environment(\.modelContext) var modelContext
    @Query(filter: #Predicate<Pack> { pack in
        pack.isInCollection }) var packs: [Pack]

    var body: some View {
        let count = (try? modelContext.fetchCount(FetchDescriptor<Card>(predicate: Card.predicate(
            searchText: viewCardModel.searchText,
            searchBy: viewCardModel.searchBy,
            filterSphere: viewCardModel.filterSphere.rawValue,
            filterType: viewCardModel.filterType.rawValue,
            filterPack: packs.map { $0.packCode },
            filterDeck: viewCardModel.filterDeck
        )))) ?? 0

        if count <= 1 {
            Text("\(count) card")
        } else {
            Text("\(count) cards")
        }
    }
}

//#Preview {
//    CardInfo()
//        .modelContainer(previewModelContainer)
//        .environment(ViewCardModel())
//}
