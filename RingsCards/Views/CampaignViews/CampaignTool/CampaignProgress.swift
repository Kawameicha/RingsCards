//
//  CampaignProgress.swift
//  RingsCards
//
//  Created by Christoph Freier on 26.06.24.
//

import SwiftUI

struct CampaignProgress: View {
    var campaign: Campaign

    var body: some View {
        ProgressView(value: Double(campaign.completed.filter{$0}.count), total: Double(campaign.completed.count))
            .progressViewStyle(ProgressStyle())
            .frame(width: 44, height: 44)
            .overlay(alignment: .center) {
                Text(String(100*campaign.completed.filter{$0}.count/campaign.completed.count) + "%")
                    .foregroundStyle(.white)
                    .font(.caption)
            }
    }
}

//#Preview {
//    ModelPreview { campaign in
//        CampaignProgress(campaign: campaign)
//    }
//    .modelContainer(previewModelContainer)
//}
