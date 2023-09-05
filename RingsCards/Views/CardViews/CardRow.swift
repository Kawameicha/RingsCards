//
//  CardRow.swift
//  RingsCards
//
//  Created by Christoph Freier on 21.08.23.
//

import SwiftUI

struct CardRow: View {
    var card: Card
    var value = 0

    var body: some View {
            HStack(spacing: 3) {
                if card.threat != nil {
                    Image(systemName: "\(card.threat ?? 0).square")
                        .foregroundColor(Color(card.sphere_name))
                        .font(.system(size: 42.0))
                } else if card.cost != nil && card.cost != "x" {
                    Image(systemName: "\(Int(card.cost!) ?? 0).circle")
                        .foregroundColor(Color(card.sphere_name))
                        .font(.system(size: 42.0))
                } else {
                    Image(systemName: "x.circle")
                        .foregroundColor(Color(card.sphere_name))
                        .font(.system(size: 42.0))
                }

            VStack(alignment: .leading, spacing: 3) {
                if value != 0 {
                    Text(card.name + " x \(value)")
                        .foregroundColor(Color(card.sphere_name))
                        .font(.headline)
                } else {
                    Text(card.name)
                        .foregroundColor(Color(card.sphere_name))
                        .font(.headline)
                }

                Text(card.traits ?? "")
                    .foregroundColor(.secondary)
                    .font(.subheadline)
            }
        }
    }
}

struct CardRow_Previews: PreviewProvider {
    static var cards = RingsData().cards

    static var previews: some View {
            CardRow(card: cards[0])
    }
}
