//
//  DeckInfo.swift
//  RingsCards
//
//  Created by Christoph Freier on 16.12.23.
//

import SwiftUI

struct DeckInfo: View {
    @Environment(ViewDeckModel.self) private var viewDeckModel

    var count: Int = 0

    var body: some View {
        @Bindable var viewDeckModel = viewDeckModel

        HStack {
            VStack {
                if count <= 1 {
                    Text("\(count) deck")
                } else {
                    Text("\(count) decks")
                }
            }
        }
    }
}

#Preview {
    DeckInfo(count: 8)
        .environment(ViewDeckModel())
}
