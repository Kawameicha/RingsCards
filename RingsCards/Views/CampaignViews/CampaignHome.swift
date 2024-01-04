//
//  CampaignHome.swift
//  RingsCards
//
//  Created by Christoph Freier on 04.01.24.
//

import SwiftUI

struct CampaignHome: View {
    @Environment(ViewCampaignModel.self) private var viewCampaignModel
    @Environment(\.modelContext) private var modelContext

    var body: some View {
        @Bindable var viewCampaignModel = viewCampaignModel

        NavigationView {
            CampaignList(
                sortCampaignParameter: viewCampaignModel.sortCampaignParameter,
                sortOrder: viewCampaignModel.sortOrder,
                searchText: viewCampaignModel.searchText
            )
            .navigationTitle("My Campaigns")
            .searchable(text: $viewCampaignModel.searchText)
        }
    }
}

#Preview {
    CampaignHome()
        .modelContainer(previewModelContainer)
        .environment(ViewCampaignModel())
}
