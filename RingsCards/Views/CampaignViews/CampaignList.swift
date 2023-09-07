//
//  CampaignList.swift
//  RingsCards
//
//  Created by Christoph Freier on 05.09.23.
//

import SwiftUI

struct CampaignList: View {
    @EnvironmentObject var ringsData: RingsData
    @State private var searchText: String = ""

    var filteredCampaigns: [Campaign] {
        guard !searchText.isEmpty else { return ringsData.campaigns }
        return ringsData.campaigns.filter { campaign in
            campaign.name.lowercased().cleaned().contains(searchText.lowercased())
        }
    }

    var body: some View {
        NavigationView {
            List {
                if ringsData.campaigns.isEmpty {
                    NavigationLink(destination: CampaignNew(), label: { Text("Create a Campaign") })
                } else {
                    ForEach(filteredCampaigns) { campaign in
                        NavigationLink {
                            ScenarioList(campaign: campaign)
                        } label: {
                            CampaignRow(campaign: campaign)
                        }
                    }
                    .onDelete(perform: removeRows)
                }
            }
            .listStyle(.sidebar)
            .navigationTitle("My Campaigns")
            .searchable(text: $searchText)
            .toolbar { NavigationLink(destination: CampaignNew(), label: { Image(systemName: "plus") }) }
        }
    }

    func removeRows(at offsets: IndexSet) {
        ringsData.campaigns.remove(atOffsets: offsets)
    }
}

struct CampaignList_Previews: PreviewProvider {    
    static var previews: some View {
        CampaignList()
            .environmentObject(RingsData())
    }
}
