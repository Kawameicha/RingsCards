//
//  CardFilterButton.swift
//  RingsCards
//
//  Created by Christoph Freier on 29.09.23.
//

import SwiftUI

struct CardFilterButton: View {
    @Environment(ViewCardModel.self) var viewCardModel

    var body: some View {
        @Bindable var viewCardModel = viewCardModel

        Menu {
            Picker("By Sphere", selection: $viewCardModel.filterSphere) {
                ForEach(FilterSphere.allCases) { parameter in
                    Text(parameter.name)
                }
            }

            Picker("By Type", selection: $viewCardModel.filterType) {
                ForEach(FilterType.allCases) { parameter in
                    Text(parameter.name)
                }
            }

        } label: {
            Label("Filter", systemImage: "line.3.horizontal.decrease")
        }
    }
}

enum FilterSphere: String, CaseIterable, Identifiable {
    case all, leadership, tactics, spirit, lore, neutral, baggins, fellowship
    var id: Self { self }
    var name: String { rawValue.capitalized }
}

enum FilterType: String, CaseIterable, Identifiable {
    case any, Hero, Ally, Attachment, Event, quest = "Player Side Quest", Contract, Campaign
    var id: Self { self }
    var name: String { rawValue.capitalized }
}

#Preview {
    CardFilterButton()
        .environment(ViewCardModel())
}
