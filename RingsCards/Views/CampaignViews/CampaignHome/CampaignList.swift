//
//  CampaignList.swift
//  RingsCards
//
//  Created by Christoph Freier on 05.09.23.
//

import SwiftUI
import SwiftData

struct CampaignList: View {
    @Environment(ViewCampaignModel.self) private var viewCampaignModel
    @Environment(\.modelContext) private var modelContext
    @Query(sort: \Campaign.update, order: .reverse) private var campaigns: [Campaign]

    init(
        sortCampaignParameter: SortCampaignParameter = .name,
        sortOrder: SortOrder = .forward,
        searchText: String = ""
    ) {
        let predicate = Campaign.predicate(searchText: searchText)
        switch sortCampaignParameter {
        case .name: _campaigns = Query(filter: predicate, sort: \.name, order: sortOrder)
        case .date_creation: _campaigns = Query(filter: predicate, sort: \.creation, order: sortOrder)
        case .date_update: _campaigns = Query(filter: predicate, sort: \.update, order: sortOrder)
        }
    }

    var body: some View {
        @Bindable var viewCampaignModel = viewCampaignModel
        
        NavigationView {
            List {
                if campaigns.isEmpty {
                    NavigationLink(destination: CampaignNew(), label: { Text("Create a Campaign") })
                } else {
                    ForEach(campaigns) { campaign in
                        NavigationLink {
                            if campaign.campaignMode == true {
                                CampaignHome(campaign: campaign)
                            } else {
                                ScenarioList(campaign: campaign)
                            }
                        } label: {
                            CampaignRow(campaign: campaign)
                        }
                    }
                    .onDelete(perform: deleteItems)
                }
            }
            .navigationTitle("My Campaigns")
            .searchable(text: $viewCampaignModel.searchText)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    CampaignSort()
                }

                ToolbarItem(placement: .topBarTrailing) {
                    NavigationLink(destination: CampaignNew(),
                                   label: { Image(systemName: "plus") })
                }

                ToolbarItem(placement: .bottomBar) {
                    CampaignInfo(count: campaigns.count)
                }
            }
        }
    }

    func deleteItems(offsets: IndexSet) {
            for index in offsets {
                modelContext.delete(campaigns[index])
        }
    }
}

#Preview {
    CampaignList()
        .modelContainer(previewModelContainer)
        .environment(ViewCampaignModel())
}
