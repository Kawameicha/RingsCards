//
//  CardInfo.swift
//  RingsCards
//
//  Created by Christoph Freier on 29.09.23.
//

import SwiftUI

struct CardInfo: View {
    @Environment(ViewCardModel.self) var viewCardModel
    @Environment(ViewDeckModel.self) var viewDeckModel

    var count: Int = 0
    var deck: Deck

    var body: some View {
        @Bindable var viewCardModel = viewCardModel
        @Bindable var viewDeckModel = viewDeckModel

        if !(deck.slots.isEmpty) {
            let player = deck.slots.reduce(0) { (result, keyValue) in
                return result + keyValue.value }
            let heroes = deck.heroes.reduce(0) { (result, keyValue) in
                return result + keyValue.value }

            VStack {
                if heroes == 0 {
                    Text("\(player - heroes) cards")
                    Text("\(Image(systemName: "exclamationmark.triangle.fill")) Contains too few heroes")
                        .foregroundStyle(.red)
                } else if (player - heroes) < 50 {
                    Text("\(player - heroes) cards")
                    Text("\(Image(systemName: "exclamationmark.triangle.fill")) Contains too few cards")
                        .foregroundStyle(.red)
                } else {
                    Text("\(player - heroes) cards")
                }
            }
        } else if count <= 1 {
            Text("\(count) card")
        } else {
            Text("\(count) cards")
        }
    }
}

#Preview {
    ModelPreview { deck in
        CardInfo(deck: deck)
    }
    .modelContainer(previewModelContainer)
    .environment(ViewCardModel())
    .environment(ViewDeckModel())
}
