//
//  CampaignList.swift
//  RingsCards
//
//  Created by Christoph Freier on 05.09.23.
//

import SwiftUI
import SwiftData

struct CampaignList: View {
    @Environment(ViewCampaignModel.self) var viewCampaignModel
    @Environment(\.modelContext) var modelContext
    @Query var campaigns: [Campaign]

    init(
        sortCampaignParameter: SortCampaignParameter = .name,
        sortOrder: SortOrder = .forward,
        searchText: String = ""
    ) {
        let predicate = Campaign.predicate(
            searchText: searchText
        )
        switch sortCampaignParameter {
        case .name: _campaigns = Query(filter: predicate, sort: \.name, order: sortOrder)
        case .date_update: _campaigns = Query(filter: predicate, sort: \.update, order: sortOrder)
        case .date_creation: _campaigns = Query(filter: predicate, sort: \.creation, order: sortOrder)
        }
    }

    var body: some View {
        @Bindable var viewCampaignModel = viewCampaignModel

        List {
            if campaigns.isEmpty {
                NavigationLink {
                    CampaignNew()
                } label: {
                    Text("Create a Campaign")
                }
            } else {
                ForEach(campaigns) { campaign in
                    NavigationLink {
                        if campaign.campaignMode == true {
                            CampaignViewHome(campaign: campaign, decks: campaign.decks ?? [Deck.emptyDeck])
                        } else {
                            ScenarioList(campaign: campaign, filterCampaign: campaign.scenarios)
                        }
                    } label: {
                        CampaignRow(campaign: campaign)
                    }
                }
                .onDelete(perform: deleteItems)
            }
        }
        .toolbar {
            ToolbarItemGroup(placement: .topBarTrailing) {
                CampaignSortButton()
                CampaignNewButton()
            }

            ToolbarItem(placement: .bottomBar) {
                CampaignInfo(count: campaigns.count)
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
