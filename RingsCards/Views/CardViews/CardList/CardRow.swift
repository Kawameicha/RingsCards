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
            if card.costs.threat != 0 {
                Image(systemName: "\(card.costs.threat).square")
                    .foregroundColor(Color(card.sphere_name))
                    .font(.system(size: 42.0))
            } else if card.costs.cost == "X" {
                Image(systemName: "x.circle")
                    .foregroundColor(Color(card.sphere_name))
                    .font(.system(size: 42.0))
            } else if card.costs.cost != "" {
                Image(systemName: "\(Int(card.costs.cost) ?? 0).circle")
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

                Text(card.texts.traits)
                    .foregroundColor(.secondary)
                    .font(.subheadline)
            }
        }
    }
}

#Preview {
    ModelPreview { card in
        CardRow(card: card)
    }
    .modelContainer(previewModelContainer)
}
