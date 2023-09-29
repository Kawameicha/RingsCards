//
//  FilterButton.swift
//  RingsCards
//
//  Created by Christoph Freier on 29.09.23.
//

import SwiftUI

struct FilterButton: View {
    @Environment(ViewModel.self) private var viewModel

    var body: some View {
        @Bindable var viewModel = viewModel

        Menu {
            Picker("Filter By", selection: $viewModel.filterParameter) {
                ForEach(FilterParameter.allCases) { parameter in
                    Text(parameter.name)
                }
            }

        } label: {
            Label("Filter", systemImage: "line.3.horizontal.decrease")
        }
    }
}

enum FilterParameter: String, CaseIterable, Identifiable {
    case all, leadership, tactics, spirit, lore, neutral, baggins, fellowship
    var id: Self { self }
    var name: String { rawValue.capitalized }
}

#Preview {
    FilterButton()
        .environment(ViewModel())
}
