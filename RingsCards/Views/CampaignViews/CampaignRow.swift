//
//  CampaignRow.swift
//  RingsCards
//
//  Created by Christoph Freier on 05.09.23.
//

import SwiftUI

struct CampaignRow: View {
    @EnvironmentObject var ringsData: RingsData

    var campaign: Campaign

    var body: some View {
        HStack(spacing: 3) {
            Image(systemName: "square.text.square")
                .font(.system(size: 42.0))

        VStack(alignment: .leading, spacing: 3) {
            Text(campaign.name)
                .font(.headline)

            Text("\(campaign.created)")
                .foregroundColor(.secondary)
                .font(.subheadline)
            }
        }
    }
}

struct CampaignRow_Previews: PreviewProvider {
    static var campaigns = RingsData().campaigns

    static var previews: some View {
            CampaignRow(campaign: campaigns[0])
                .environmentObject(RingsData())
    }
}
