//
//  CampaignSortButton.swift
//  RingsCards
//
//  Created by Christoph Freier on 16.12.23.
//

import SwiftUI

struct CampaignSortButton: View {
    @Environment(ViewCampaignModel.self) private var viewCampaignModel

    var body: some View {
        @Bindable var viewCampaignModel = viewCampaignModel

        Menu {
            Picker("Sort Order", selection: $viewCampaignModel.sortOrder) {
                ForEach([SortOrder.forward, .reverse], id: \.self) { order in
                    Text(order.name)
                }
            }

            Picker("Sort By", selection: $viewCampaignModel.sortCampaignParameter) {
                ForEach(SortCampaignParameter.allCases) { parameter in
                    Text(parameter.name)
                }
            }

        } label: {
            Label("Sort", systemImage: "arrow.up.arrow.down")
        }
    }
}

enum SortCampaignParameter: String, CaseIterable, Identifiable {
    case name, date_update = "updated", date_creation = "created"
    var id: Self { self }
    var name: String { rawValue.capitalized }
}

#Preview {
    CampaignSortButton()
        .environment(ViewCampaignModel())
}
