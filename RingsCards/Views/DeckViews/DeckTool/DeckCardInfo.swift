//
//  DeckCardInfo.swift
//  RingsCards
//
//  Created by Christoph Freier on 17.12.23.
//

import SwiftUI

struct DeckCardInfo: View {
    @Environment(ViewDeckModel.self) var viewDeckModel

    var deck: Deck

    var body: some View {
        @Bindable var viewDeckModel = viewDeckModel
        
        let player = self.deck.slots.reduce(0) { (result, keyValue) in
            return result + keyValue.value }
        let heroes = self.deck.heroes.reduce(0) { (result, keyValue) in
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
    }
}

#Preview {
    ModelPreview { deck in
        DeckCardInfo(deck: deck)
    }
    .modelContainer(previewModelContainer)
    .environment(ViewDeckModel())
}
