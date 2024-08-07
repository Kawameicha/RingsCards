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
                if heroes < 3 {
                    if heroes < 2 {
                        Text("\(heroes) Hero, \(player - heroes) Card")
                            .foregroundColor(.secondary)
                            .font(.subheadline)
                        Text("\(Image(systemName: "exclamationmark.triangle.fill")) Contains too few heroes")
                            .foregroundStyle(.red)
                    } else {
                        Text("\(heroes) Heroes, \(player - heroes) Cards")
                            .foregroundColor(.secondary)
                            .font(.subheadline)
                        Text("\(Image(systemName: "exclamationmark.triangle.fill")) Contains too few heroes")
                            .foregroundStyle(.red)
                    }
                } else {
                    if player - heroes < 2 {
                        Text("\(heroes) Heroes, \(player - heroes) Card")
                            .foregroundColor(.secondary)
                            .font(.subheadline)
                        Text("\(Image(systemName: "exclamationmark.triangle.fill")) Contains too few cards")
                            .foregroundStyle(.red)
                    } else if player - heroes < 50 {
                        Text("\(heroes) Heroes, \(player - heroes) Cards")
                            .foregroundColor(.secondary)
                            .font(.subheadline)
                        Text("\(Image(systemName: "exclamationmark.triangle.fill")) Contains too few cards")
                            .foregroundStyle(.red)
                    } else {
                        Text("\(heroes) Heroes, \(player - heroes) Cards")
                            .foregroundColor(.secondary)
                            .font(.subheadline)
                    }
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
