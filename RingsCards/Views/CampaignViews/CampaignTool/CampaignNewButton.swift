//
//  CampaignNewButton.swift
//  RingsCards
//
//  Created by Christoph Freier on 04.01.24.
//

import SwiftUI

struct CampaignNewButton: View {
    var body: some View {
        NavigationLink {
            CampaignNew()
        } label: {
            Image(systemName: "plus")
        }
    }
}

#Preview {
    CampaignNewButton()
}
