//
//  DeckRow.swift
//  RingsCards
//
//  Created by Christoph Freier on 28.08.23.
//

import SwiftUI

struct DeckRow: View {
    var deck: Deck

    var body: some View {
        let player = deck.cardSlots.reduce(0) { (result, keyValue) in
            return result + keyValue.value }
        let heroes = deck.heroes.reduce(0) { (result, keyValue) in
            return result + keyValue.value }

        HStack(spacing: 3) {
            Image(systemName: "\(deck.threat).square")
                .font(.system(size: 42))

            VStack(alignment: .leading, spacing: 3) {
                Text(deck.name)
                    .font(.headline)
                
                if heroes < 2 {
                    if player - heroes < 2 {
                        Text("\(heroes) Hero, \(player - heroes) Card")
                            .foregroundColor(.secondary)
                            .font(.subheadline)
                    } else {
                        Text("\(heroes) Hero, \(player - heroes) Cards")
                            .foregroundColor(.secondary)
                            .font(.subheadline)
                    }
                } else {
                    if player - heroes < 2 {
                        Text("\(heroes) Heroes, \(player - heroes) Card")
                            .foregroundColor(.secondary)
                            .font(.subheadline)
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
//        DeckRow(deck: deck)
//    }
//    .modelContainer(previewModelContainer)
//}
