//
//  DeckCampaignButton.swift
//  RingsCards
//
//  Created by Christoph Freier on 03.09.24.
//

import SwiftUI

struct DeckCampaignButton: View {
    @Binding var campaign: Bool

    var body: some View {
        Button {
            campaign.toggle()
        } label: {
            Label("Show Campaign", systemImage: "books.vertical.fill")
        }
    }
}

#Preview {
    DeckCampaignButton(campaign: .constant(true))
}
