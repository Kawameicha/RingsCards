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
        Text("^[\(count) campaign](inflect: true)")
    }
}

#Preview {
    CampaignInfo(count: 8)
}
