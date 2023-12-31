//
//  DeckSort.swift
//  RingsCards
//
//  Created by Christoph Freier on 16.12.23.
//

import SwiftUI

struct DeckSort: View {
    @Environment(ViewDeckModel.self) var viewDeckModel

    var body: some View {
        @Bindable var viewDeckModel = viewDeckModel

        Menu {
            Picker("Sort Order", selection: $viewDeckModel.sortOrder) {
                ForEach([SortOrder.forward, .reverse], id: \.self) { order in
                    Text(order.name)
                }
            }

            Picker("Sort By", selection: $viewDeckModel.sortDeckParameter) {
                ForEach(SortDeckParameter.allCases) { parameter in
                    Text(parameter.name)
                }
            }

        } label: {
            Label("Sort", systemImage: "arrow.up.arrow.down")
        }
    }
}

enum SortDeckParameter: String, CaseIterable, Identifiable {
    case name, date_update = "updated", date_creation = "created"
    var id: Self { self }
    var name: String { rawValue.capitalized }
}

#Preview {
    DeckSort()
        .environment(ViewDeckModel())
}
