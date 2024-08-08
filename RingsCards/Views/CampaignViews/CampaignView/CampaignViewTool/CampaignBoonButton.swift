//
//  CampaignBoonButton.swift
//  RingsCards
//
//  Created by Christoph Freier on 04.01.24.
//

import SwiftUI

struct CampaignBoonButton: View {
    @Binding var editBoon: Bool

    var body: some View {
        Button {
            editBoon.toggle()
        } label: {
            Label("Edit Boons", systemImage: editBoon ? "rectangle.portrait.slash" : "rectangle.portrait.on.rectangle.portrait")
        }
    }
}

#Preview {
    CampaignBoonButton(editBoon: .constant(true))
}
