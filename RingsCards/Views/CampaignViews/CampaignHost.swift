//
//  CampaignHost.swift
//  RingsCards
//
//  Created by Christoph Freier on 04.09.23.
//

import SwiftUI

struct CampaignHost: View {
    @Environment(\.editMode) var editMode
    @EnvironmentObject var ringsData: RingsData
    @State private var draftCampaign = Campaign.default

    var campaign: Campaign

    var campaignIndex: Int {
        ringsData.campaigns.firstIndex(where: { $0.id == campaign.id }) ?? 0
    }

    var body: some View {
        if ringsData.campaigns.isEmpty {
            // Do nothing if no campaign
        } else {
            VStack(alignment: .leading, spacing: 20) {
                HStack {
                    if editMode?.wrappedValue == .active {
                        Button("Cancel", role: .cancel) {
                            draftCampaign = ringsData.campaigns[campaignIndex]
                            editMode?.animation().wrappedValue = .inactive
                        }
                    }
                    Spacer()
                    EditButton()
                }

                if editMode?.wrappedValue == .inactive {
                    CampaignView(campaign: ringsData.campaigns[campaignIndex])
                } else {
                    CampaignEdit(campaign: $draftCampaign)
                        .onAppear {
                            draftCampaign = ringsData.campaigns[campaignIndex]
                        }
                        .onDisappear {
                            ringsData.campaigns[campaignIndex] = draftCampaign
                    }
                }
            }
            .padding()
        }
    }
}

struct CampaignHost_Previews: PreviewProvider {
    static var previews: some View {
        CampaignHost(campaign: Campaign.default)
            .environmentObject(RingsData())
    }
}
