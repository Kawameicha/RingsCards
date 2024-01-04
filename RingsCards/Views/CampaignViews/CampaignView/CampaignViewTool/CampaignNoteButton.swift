//
//  CampaignNoteButton.swift
//  RingsCards
//
//  Created by Christoph Freier on 04.01.24.
//

import SwiftUI

struct CampaignNoteButton: View {
    @Binding var editNotes: Bool

    var body: some View {
        Button {
            editNotes.toggle()
        } label: {
            Label("Edit Notes", systemImage: "list.bullet.clipboard")
        }
    }
}


#Preview {
    CampaignNoteButton(editNotes: .constant(true))
}
