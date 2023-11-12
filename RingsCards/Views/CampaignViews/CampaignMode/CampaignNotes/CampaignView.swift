//
//  CampaignView.swift
//  RingsCards
//
//  Created by Shane Eastwood on 2023-08-22.
//

import SwiftUI

struct CampaignView: View {
    var campaign: Campaign

    var body: some View {
        ScrollView  {
            VStack(alignment: .leading, spacing: 10) {
                Text(campaign.name)
                    .bold()
                    .font(.title)
                Text("Created: ") + Text("\(campaign.creation.formatted(date: .abbreviated, time: .shortened))")

                Divider()

                HStack {
                    Text("Fallen Heroes: \(campaign.fallenHeros)")
                    Spacer()
                    Text("Threat Penalty: \(campaign.threatPenalty)")
                }

                Divider()

                Text("Notes: \(campaign.notes)")
            }
        }
    }
}

#Preview {
    ModelPreview { campaign in
        CampaignView(campaign: campaign)
    }
    .modelContainer(previewModelContainer)
}
