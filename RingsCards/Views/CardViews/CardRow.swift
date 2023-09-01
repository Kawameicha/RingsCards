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
                .foregroundColor(Color(card.sphere_name))
                .font(.headline)
            HStack(spacing: 3) {
                Label(card.pack_name, systemImage: "rectangle.portrait")
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
