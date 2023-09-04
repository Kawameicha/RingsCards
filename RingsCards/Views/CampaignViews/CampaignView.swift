//
//  CampaignView.swift
//  RingsCards
//
//  Created by Shane Eastwood on 2023-08-22.
//

import SwiftUI

struct CampaignView: View {
    @EnvironmentObject var ringsData: RingsData

    var campaign: Campaign

    var body: some View {
        ScrollView  {
            VStack(alignment: .leading, spacing: 10) {
                Text(campaign.name)
                    .bold()
                    .font(.title)
                Text("Created: ") + Text(campaign.created, style: .date)

                Divider()

                HStack {
                    Text("Fallen Heroes: \(campaign.fallenHeros)")
                    Spacer()
                    Text("Threat Penalty: \(campaign.threatPenalty)")
                }

                Divider()

                Text("Notes: \(campaign.notes)")

                Divider()

                HStack {
                    Text("Boon: \(campaign.boons)")
                    Spacer()
                    Text("Burden: \(campaign.burdens)")
                }
            }
        }
    }
}

struct CampaignView_Previews: PreviewProvider {
    static var previews: some View {
        CampaignView(campaign: Campaign.default)
            .environmentObject(RingsData())
    }
}
