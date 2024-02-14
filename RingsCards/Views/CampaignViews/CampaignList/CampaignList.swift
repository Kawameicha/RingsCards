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
                NavigationLink(value: Router.campaignNew) {
                    Text("Create a Campaign")
                }
            } else {
                ForEach(campaigns) { campaign in
                    
                    if campaign.campaignMode == true {
                        NavigationLink(value: Router.campaignViewHome(campaign: campaign, decks: campaign.decks ?? [Deck.emptyDeck])) {
                            CampaignRow(campaign: campaign)
                        }
                        
                    } else {
                        NavigationLink(value: Router.scenarioList(campaign: campaign, filterCampaign: campaign.scenarios)) {
                            CampaignRow(campaign: campaign)
                        }
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

            ToolbarItem(placement: .principal) {
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
