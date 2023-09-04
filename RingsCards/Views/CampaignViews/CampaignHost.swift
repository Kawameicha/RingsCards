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

    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            HStack {
                if editMode?.wrappedValue == .active {
                    Button("Cancel", role: .cancel) {
                        draftCampaign = ringsData.campaigns
                        editMode?.animation().wrappedValue = .inactive
                    }
                }
                Spacer()
                EditButton()
            }

            if editMode?.wrappedValue == .inactive {
                CampaignView(campaign:ringsData.campaigns)
            } else {
                CampaignEdit(campaign: $draftCampaign)
                    .onAppear {
                        draftCampaign = ringsData.campaigns
                    }
                    .onDisappear {
                        ringsData.campaigns = draftCampaign
                }
            }
        }
        .padding()
    }
}

struct CampaignHost_Previews: PreviewProvider {
    static var previews: some View {
        CampaignHost()
            .environmentObject(RingsData())
    }
}
