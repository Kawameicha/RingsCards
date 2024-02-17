//
//  CampaignNewButton.swift
//  RingsCards
//
//  Created by Christoph Freier on 04.01.24.
//

import SwiftUI

struct CampaignNewButton: View {
    var body: some View {
        NavigationLink(value: Router.campaignNew) {
            Image(systemName: "plus")
        }
    }
}

#Preview {
    CampaignNewButton()
}
