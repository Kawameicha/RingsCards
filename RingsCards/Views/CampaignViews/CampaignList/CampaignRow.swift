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
            Image(systemName: "square.text.square")
                .font(.system(size: 42.0))

            VStack(alignment: .leading, spacing: 3) {
                Text(campaign.name)
                    .font(.headline)

                Text("\(campaign.creation.formatted(date: .abbreviated, time: .shortened))")
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
