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
        HStack(spacing: 3) {
            if deck.starting_threat != 0 {
                Image(systemName: "\(deck.starting_threat).square")
                    .font(.system(size: 42.0))
            } else {
                Image(systemName: "x.square")
                    .font(.system(size: 42.0))
            }

        VStack(alignment: .leading, spacing: 3) {
            Text(deck.name)
                .font(.headline)

            Text("\(deck.heroes.count) Heroes, Cards up to \(deck.last_pack)")
                .foregroundColor(.secondary)
                .font(.subheadline)
            }
        }
    }
}

struct DeckRow_Previews: PreviewProvider {
    static var decks = RingsData().decks

    static var previews: some View {
        Group {
            DeckRow(deck: decks[0])
        }
    }
}
