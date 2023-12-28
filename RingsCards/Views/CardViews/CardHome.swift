//
//  CardHome.swift
//  RingsCards
//
//  Created by Christoph Freier on 20.08.23.
//

import SwiftUI
import SwiftData

struct CardHome: View {
    @Environment(ViewCardModel.self) private var viewCardModel
    @Environment(\.modelContext) private var modelContext

    // Make it an observable object and use CollectionToggle
    @Query private var packs: [Pack]

    var collection: [String] {
        packs.map { pack in
            pack.isInCollection ? pack.packCode : ""
        }
    }
    // ----------

    var body: some View {
        @Bindable var viewCardModel = viewCardModel

        NavigationView {
            CardList(
                filterSphere: viewCardModel.filterSphere,
                filterType: viewCardModel.filterType,
                filterPack: collection,
                filterDeck: [],
                sortParameter: viewCardModel.sortParameter,
                sortOrder: viewCardModel.sortOrder,
                searchText: viewCardModel.searchText
            )
                .refreshable {
                    await CardResponse.refresh(modelContext: modelContext)
                }
                .navigationTitle("Player Cards")
                .searchable(text: $viewCardModel.searchText)
                .toolbar {
                    ToolbarItem(placement: .topBarTrailing) {
                        FilterButton()
                    }

                    ToolbarItem(placement: .topBarTrailing) {
                        SortButton()
                    }
                }
        }
    }
}

#Preview {
    CardHome()
        .modelContainer(previewModelContainer)
        .environment(ViewCardModel())
}
