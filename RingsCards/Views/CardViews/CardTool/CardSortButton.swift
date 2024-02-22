//
//  CardSortButton.swift
//  RingsCards
//
//  Created by Christoph Freier on 28.09.23.
//

import SwiftUI

struct CardSortButton: View {
    @Environment(ViewCardModel.self) var viewCardModel

    var body: some View {
        @Bindable var viewCardModel = viewCardModel

        Menu {
            Picker("Sort Order", selection: $viewCardModel.sortOrder) {
                ForEach([SortOrder.forward, .reverse], id: \.self) { order in
                    Text(order.name)
                }
            }

            Picker("Sort By", selection: $viewCardModel.sortParameter) {
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
        case .forward: "Increasing"
        case .reverse: "Decreasing"
        }
    }
}

enum SortParameter: String, CaseIterable, Identifiable {
    case code = "Pack", name, cost, sphere
    var id: Self { self }
    var name: String { rawValue.capitalized }
}

#Preview {
    CardSortButton()
        .environment(ViewCardModel())
}
