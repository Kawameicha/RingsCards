//
//  DeckNewButton.swift
//  RingsCards
//
//  Created by Christoph Freier on 02.01.24.
//

import SwiftUI

struct DeckNewButton: View {
    var body: some View {
        NavigationLink(value: Router.deckNew) {
            Image(systemName: "plus")
        }
    }
}

#Preview {
    DeckNewButton()
}
