//
//  CardCount.swift
//  RingsCards
//
//  Created by Christoph Freier on 03.08.24.
//

import SwiftUI

struct CardCount: View {
    var card: Card
    var value = 0

    var body: some View {
        Image(systemName: "rectangle.portrait.inset.filled")
            .foregroundColor(Color(card.sphereName))
            .overlay(alignment: .center) {
                Text("x\(value)")
                    .font(.system(size: 16))
                    .colorInvert()
            }
            .font(.system(size: 34))
    }
}

//#Preview {
//    ModelPreview { card in
//        CardCount(card: card)
//    }
//    .modelContainer(previewModelContainer)
//}
