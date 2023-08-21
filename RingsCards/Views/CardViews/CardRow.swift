//
//  CardRow.swift
//  RingsCards
//
//  Created by Christoph Freier on 21.08.23.
//

import SwiftUI

struct CardRow: View {
    var card: Card

    var body: some View {
        VStack(alignment: .leading, spacing: 3) {
            Text(card.name)
                .foregroundColor(.primary)
                .font(.headline)
            HStack(spacing: 3) {
                Label(card.sphere_name, systemImage: "person")
            }
            .foregroundColor(.secondary)
            .font(.subheadline)
        }
    }
}

struct CardRow_Previews: PreviewProvider {
    static var cards = RingsData().cards

    static var previews: some View {
        Group {
            CardRow(card: cards[0])
        }
    }
}
