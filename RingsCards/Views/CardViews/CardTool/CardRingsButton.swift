//
//  CardRingsButton.swift
//  RingsCards
//
//  Created by Christoph Freier on 02.08.24.
//

import SwiftUI

struct CardRingsButton: View {
    var card: Card

    var body: some View {
        Link(destination: URL(string: "\(card.texts.url)")!) {
            Image(systemName: "globe")
        }
    }
}

//#Preview {
//    ModelPreview { card in
//        CardRingsButton(card: card)
//    }
//    .modelContainer(previewModelContainer)
//}
