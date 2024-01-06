//
//  CampaignInfo.swift
//  RingsCards
//
//  Created by Christoph Freier on 16.12.23.
//

import SwiftUI

struct CampaignInfo: View {
    var count: Int = 0

    var body: some View {
        if count <= 1 {
            Text("\(count) campaign")
        } else {
            Text("\(count) campaigns")
        }
    }
}

#Preview {
    CampaignInfo(count: 8)
}
