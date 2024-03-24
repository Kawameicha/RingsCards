//
//  CardSearchButton.swift
//  RingsCards
//
//  Created by Christoph Freier on 24.03.24.
//

import SwiftUI

struct CardSearchButton: View {
    @Environment(ViewCardModel.self) var viewCardModel

    var body: some View {
        @Bindable var viewCardModel = viewCardModel

        Menu {
            Picker("Search By", selection: $viewCardModel.searchBy) {
                ForEach(SearchParameter.allCases) { parameter in
                    Text(parameter.name)
                }
            }

        } label: {
            Label("Search", systemImage: "magnifyingglass")
        }
    }
}

enum SearchParameter: String, CaseIterable, Identifiable {
    case name, trait, text, illustrator
    var id: Self { self }
    var name: String { rawValue.capitalized }
}

#Preview {
    CardSearchButton()
        .environment(ViewCardModel())
}
