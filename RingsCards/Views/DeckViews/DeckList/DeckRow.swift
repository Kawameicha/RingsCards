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
                .foregroundStyle(.white)
                .font(.system(size: 42))

            VStack(alignment: .leading, spacing: 3) {
                Text(deck.name)
                    .foregroundStyle(.white)
                    .font(.headline)
                
                if heroes < 2 {
                    if player - heroes < 2 {
                        Text("\(heroes) Hero, \(player - heroes) Card")
                            .foregroundStyle(.white)
                            .font(.subheadline)
                    } else {
                        Text("\(heroes) Hero, \(player - heroes) Cards")
                            .foregroundStyle(.white)
                            .font(.subheadline)
                    }
                } else {
                    if player - heroes < 2 {
                        Text("\(heroes) Heroes, \(player - heroes) Card")
                            .foregroundStyle(.white)
                            .font(.subheadline)
                    } else {
                        Text("\(heroes) Heroes, \(player - heroes) Cards")
                            .foregroundStyle(.white)
                            .font(.subheadline)
                    }
                }
            }

            Spacer()

            DeckChart(deck: deck)
        }
    }
}

//#Preview {
//    ModelPreview { deck in
//        DeckRow(deck: deck)
//    }
//    .modelContainer(previewModelContainer)
//}
