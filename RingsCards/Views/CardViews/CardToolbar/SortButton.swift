//
//  SortButton.swift
//  RingsCards
//
//  Created by Christoph Freier on 28.09.23.
//

import SwiftUI

struct SortButton: View {
    @Environment(ViewModel.self) private var viewModel

    var body: some View {
        @Bindable var viewModel = viewModel

        Menu {
            Picker("Sort Order", selection: $viewModel.sortOrder) {
                ForEach([SortOrder.forward, .reverse], id: \.self) { order in
                    Text(order.name)
                }
            }

            Picker("Sort By", selection: $viewModel.sortParameter) {
                ForEach(SortParameter.allCases) { parameter in
                    Text(parameter.name)
                }
            }

        } label: {
            Label("Sort", systemImage: "arrow.up.arrow.down")
        }
    }
}

extension SortOrder {
    var name: String {
        switch self {
        case .forward: "Forward"
        case .reverse: "Reverse"
        }
    }
}

enum SortParameter: String, CaseIterable, Identifiable {
    case name, sphere
    var id: Self { self }
    var name: String { rawValue.capitalized }
}

#Preview {
    SortButton()
        .environment(ViewModel())
}
