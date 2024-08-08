//
//  CampaignNoteButton.swift
//  RingsCards
//
//  Created by Christoph Freier on 04.01.24.
//

import SwiftUI

struct CampaignNoteButton: View {
    @Binding var editNote: Bool

    var body: some View {
        Button {
            editNote.toggle()
        } label: {
            Label("Edit Notes", systemImage: "list.bullet.clipboard")
        }
    }
}


#Preview {
    CampaignNoteButton(editNote: .constant(true))
}
