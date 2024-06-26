//
//  CampaignImage.swift
//  RingsCards
//
//  Created by Christoph Freier on 26.06.24.
//

import SwiftUI

struct CampaignImage: View {
    var campaign: Campaign

    var body: some View {
        GeometryReader { geometry in
            Image(campaign.code + "_cover")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: geometry.size.width, height: geometry.size.height)
                .clipShape(Rectangle())
                .opacity(0.7)
        }
    }
}

//#Preview {
//    ModelPreview { campaign in
//        CampaignImage(campaign: campaign)
//    }
//    .modelContainer(previewModelContainer)
//}
