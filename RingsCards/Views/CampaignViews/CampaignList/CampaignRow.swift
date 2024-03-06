//
//  CampaignRow.swift
//  RingsCards
//
//  Created by Christoph Freier on 05.09.23.
//

import SwiftUI

struct CampaignRow: View {
    var campaign: Campaign

    var body: some View {
        HStack(spacing: 3) {
            PackIcon(image: Image(campaign.code), frame: 44)

            VStack(alignment: .leading, spacing: 3) {
                Text(campaign.name)
                    .font(.headline)

                Text("\(campaign.created.formatted(date: .abbreviated, time: .shortened))")
                    .foregroundColor(.secondary)
                    .font(.subheadline)
            }
        }
    }
}

#Preview {
    ModelPreview { campaign in
        CampaignRow(campaign: campaign)
    }
    .modelContainer(previewModelContainer)
}
