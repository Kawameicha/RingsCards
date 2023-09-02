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
        VStack(alignment: .leading, spacing: 3) {
            Text(deck.name)
                .font(.headline)
            HStack(spacing: 3) {
                Label("\(deck.heroes.count) Heroes, Cards up to \(deck.last_pack)", systemImage: "person.3")
            }
            .foregroundColor(.secondary)
            .font(.subheadline)
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
