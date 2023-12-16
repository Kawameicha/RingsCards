//
//  SortButton.swift
//  RingsCards
//
//  Created by Christoph Freier on 28.09.23.
//

import SwiftUI

struct SortButton: View {
    @Environment(ViewCardModel.self) private var viewCardModel

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
        .environment(ViewCardModel())
}
