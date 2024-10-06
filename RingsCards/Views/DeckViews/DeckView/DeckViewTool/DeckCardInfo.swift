//
//  DeckCardInfo.swift
//  RingsCards
//
//  Created by Christoph Freier on 06.03.24.
//

import SwiftUI

struct DeckCardInfo: View {
    var deck: Deck

    var body: some View {
        if !(deck.cardSlots.isEmpty) {
            let player = deck.cardSlots.reduce(0) { (result, keyValue) in
                return result + keyValue.value }
            let heroes = deck.heroes.reduce(0) { (result, keyValue) in
                return result + keyValue.value }

            VStack {
                Text("^[\(heroes) Hero](inflect: true), ^[\(player - heroes) Card](inflect: true)")

                if heroes < 3 {
                    Text("\(Image(systemName: "exclamationmark.triangle.fill")) Contains too few heroes")
                        .foregroundStyle(.red)
                } else if player - heroes < 50 {
                    Text("\(Image(systemName: "exclamationmark.triangle.fill")) Contains too few cards")
                        .foregroundStyle(.red)
                }
            }
        }
    }
}

//#Preview {
//    ModelPreview { deck in
//        DeckCardInfo(deck: deck)
//    }
//    .modelContainer(previewModelContainer)
//}
