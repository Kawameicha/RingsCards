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
            if card.costs.threat != -1 {
                Image(systemName: "\(card.costs.threat).square")
                    .foregroundColor(Color(card.sphereName))
                    .font(.system(size: 42))
            } else if card.costs.cost == "X" {
                Image(systemName: "x.circle")
                    .foregroundColor(Color(card.sphereName))
                    .font(.system(size: 42))
            } else if card.costs.cost != "" {
                Image(systemName: "\(Int(card.costs.cost) ?? 0).circle")
                    .foregroundColor(Color(card.sphereName))
                    .font(.system(size: 42))
            } else {
                Image(systemName: "x.circle")
                    .foregroundColor(Color(card.sphereName))
                    .font(.system(size: 42))
            }

            VStack(alignment: .leading, spacing: 3) {
                if value != 0 {
                    Text(card.name + " x \(value)")
                        .foregroundColor(Color(card.sphereName))
                        .font(.headline)
                } else {
                    Text(card.name)
                        .foregroundColor(Color(card.sphereName))
                        .font(.headline)
                }

                if card.typeCode == "hero" || card.typeCode == "ally" {
                    HStack {
                        Text("\(card.stats.willpower ?? 0)" + " \u{E600}")
                            .font(Font.custom("SFUIText-Regular", size: 14))
                        Text("\(card.stats.attack ?? 0)" + " \u{E601}")
                            .font(Font.custom("SFUIText-Regular", size: 14))
                        Text("\(card.stats.defense ?? 0)" + " \u{E602}")
                            .font(Font.custom("SFUIText-Regular", size: 14))
                        Text("\(card.stats.health ?? 0)" + " \u{E603}")
                            .font(Font.custom("SFUIText-Regular", size: 14))
                    }
                } else {
                    Text(card.texts.traits)
                        .foregroundColor(.secondary)
                        .font(.subheadline)
                }
            }
        }
    }
}

//#Preview {
//    ModelPreview { card in
//        CardRow(card: card)
//    }
//    .modelContainer(previewModelContainer)
//}
