//
//  CardHome.swift
//  RingsCards
//
//  Created by Christoph Freier on 20.08.23.
//

import SwiftUI
import SwiftData

struct CardHome: View {
    @Environment(ViewCardModel.self) var viewCardModel
    @Environment(\.modelContext) var modelContext
    @Query(filter: #Predicate<Pack> { pack in
        pack.isInCollection }) var packs: [Pack]

    var body: some View {
        @Bindable var viewCardModel = viewCardModel

        CardList(
            filterSphere: viewCardModel.filterSphere,
            filterType: viewCardModel.filterType,
            filterPack: packs.map { $0.packCode },
            filterDeck: [],
            sortParameter: viewCardModel.sortParameter,
            sortOrder: viewCardModel.sortOrder,
            searchText: viewCardModel.searchText,
            searchBy: viewCardModel.searchBy,
            listOffset: viewCardModel.listOffset
        )
        .navigationTitle("Player Cards")
        .searchable(text: $viewCardModel.searchText)
        .disableAutocorrection(true)
        .refreshable {
            await CardResponse.refresh(modelContext: modelContext)
        }
    }
}

//#Preview {
//    CardHome()
//        .modelContainer(previewModelContainer)
//        .environment(ViewCardModel())
//}
