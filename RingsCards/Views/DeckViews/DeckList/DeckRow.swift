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

        HStack(alignment: .center, spacing: 3) {
            Image(systemName: "\(deck.threat).square")
                .font(.system(size: 42))

            VStack(alignment: .leading, spacing: 3) {
                Text(deck.name)
                    .font(.headline)

                HStack(alignment: .bottom, spacing: 3) {
                    Image(systemName: "person.3.fill")
                    Text("x\(heroes)     ")
                    Image(systemName: "rectangle.portrait.inset.filled")
                    Text("x\(player - heroes)")
                }
                .font(.subheadline)
            }

            Spacer()

            DeckChart(deck: deck)
        }
        .foregroundStyle(.white)
        .lineLimit(1)
    }
}

//#Preview {
//    ModelPreview { deck in
//        DeckRow(deck: deck)
//    }
//    .modelContainer(previewModelContainer)
//}
