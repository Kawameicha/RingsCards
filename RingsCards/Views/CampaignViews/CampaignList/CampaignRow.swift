//
//  CampaignRow.swift
//  RingsCards
//
//  Created by Christoph Freier on 05.09.23.
//

import SwiftUI

struct CampaignRow: View {
    @Environment(\.colorScheme) var colorScheme
    var campaign: Campaign

    var body: some View {
        HStack(spacing: 3) {
            if colorScheme == .dark {
                PackIcon(image: Image(campaign.code), frame: 44)
            } else {
                PackIcon(image: Image(campaign.code), frame: 44)
                    .foregroundColor(.white)
                    .colorInvert()
            }

            VStack(alignment: .leading, spacing: 3) {
                Text(campaign.name)
                    .foregroundStyle(.white)
                    .font(.headline)

                Text("\(campaign.created.formatted(date: .abbreviated, time: .shortened))")
                    .foregroundStyle(.white)
                    .font(.subheadline)
            }

            Spacer()

            CampaignProgress(campaign: campaign)
        }
        .lineLimit(1)
    }
}

//#Preview {
//    ModelPreview { campaign in
//        CampaignRow(campaign: campaign)
//    }
//    .modelContainer(previewModelContainer)
//}
