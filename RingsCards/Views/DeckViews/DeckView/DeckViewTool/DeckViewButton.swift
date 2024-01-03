//
//  DeckViewButton.swift
//  RingsCards
//
//  Created by Christoph Freier on 02.01.24.
//

import SwiftUI

struct DeckViewButton: View {
    @Binding var viewCard: Bool

    var body: some View {
        Button {
            viewCard.toggle()
        } label: {
            Label("Add Cards", systemImage: viewCard ? "pencil.slash" : "pencil.line")
        }
    }
}

#Preview {
    DeckViewButton(viewCard: .constant(true))
}
