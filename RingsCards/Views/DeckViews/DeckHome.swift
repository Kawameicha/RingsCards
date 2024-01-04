//
//  DeckHome.swift
//  RingsCards
//
//  Created by Christoph Freier on 30.12.23.
//

import SwiftUI

struct DeckHome: View {
    @Environment(ViewDeckModel.self) var viewDeckModel
    @Environment(\.modelContext) var modelContext

    var body: some View {
        @Bindable var viewDeckModel = viewDeckModel

        NavigationView {
            DeckList(
                sortDeckParameter: viewDeckModel.sortDeckParameter,
                sortOrder: viewDeckModel.sortOrder,
                searchText: viewDeckModel.searchText
            )
            .navigationTitle("My Decks")
            .searchable(text: $viewDeckModel.searchText)
        }
    }
}

#Preview {
    DeckHome()
        .modelContainer(previewModelContainer)
        .environment(ViewCardModel())
        .environment(ViewDeckModel())
}
