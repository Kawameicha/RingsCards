//
//  CampaignList.swift
//  RingsCards
//
//  Created by Christoph Freier on 05.09.23.
//

import SwiftUI
import SwiftData

struct CampaignList: View {
    @Environment(\.modelContext) private var modelContext
    @Query(sort: \Campaign.update, order: .reverse) private var campaigns: [Campaign]
    @State private var searchText: String = ""

    var filteredCampaigns: [Campaign] {
        guard !searchText.isEmpty else { return campaigns }
        return campaigns.filter { campaign in
            campaign.name.lowercased().cleaned().contains(searchText.lowercased())
        }
    }

    var body: some View {
        NavigationView {
            List {
                if campaigns.isEmpty {
                    NavigationLink(destination: CampaignNew(), label: { Text("Create a Campaign") })
                } else {
                    ForEach(filteredCampaigns) { campaign in
                        NavigationLink {
                            ScenarioList(campaign: campaign)
                        } label: {
                            CampaignRow(campaign: campaign)
                        }
                    }
                    .onDelete(perform: deleteItems)
                }
            }
            .listStyle(.sidebar)
            .navigationTitle("My Campaigns")
            .searchable(text: $searchText)
            .toolbar {
                ToolbarItem {
                    NavigationLink(destination: CampaignNew(),
                                   label: { Image(systemName: "plus") })
                }
                ToolbarItem(placement: .bottomBar) {
                    Text("\(filteredCampaigns.count) campaigns")
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
}
