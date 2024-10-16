//
//  DeckEditButton.swift
//  RingsCards
//
//  Created by Christoph Freier on 02.01.24.
//

import SwiftUI

struct DeckEditButton: View {
    @Binding var editCard: Bool

    var body: some View {
        Button {
            editCard.toggle()
        } label: {
            Label("Edit Cards", systemImage: editCard ? "pencil.slash" : "pencil.line")
        }
    }
}

#Preview {
    DeckEditButton(editCard: .constant(true))
}
