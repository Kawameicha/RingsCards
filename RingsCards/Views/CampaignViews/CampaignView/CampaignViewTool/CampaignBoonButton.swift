//
//  CampaignBoonButton.swift
//  RingsCards
//
//  Created by Christoph Freier on 04.01.24.
//

import SwiftUI

struct CampaignBoonButton: View {
    @Binding var editBoons: Bool

    var body: some View {
        Button {
            editBoons.toggle()
        } label: {
            Label("Edit Boons", systemImage: editBoons ? "rectangle.portrait.slash" : "rectangle.portrait.on.rectangle.portrait")
        }
    }
}

#Preview {
    CampaignBoonButton(editBoons: .constant(true))
}
