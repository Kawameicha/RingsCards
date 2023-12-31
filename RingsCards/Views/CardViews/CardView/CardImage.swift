//
//  CardImage.swift
//  RingsCards
//
//  Created by Christoph Freier on 11.09.23.
//

import SwiftUI

struct CardImage: View {
    var card: Card

    var body: some View {
        AsyncImage(url: URL(string: "https://www.ringsdb.com\(card.imagesrc)")) { image in
            image
                .resizable()
                .scaledToFit()
                .frame(width: 350)
        } placeholder: {
            ProgressView()
        }
        .clipShape(
            Circle().offset(y:-50))
        .overlay {
            Circle().stroke(.white, lineWidth: 4).offset(y:-50)
        }
        .shadow(radius: 9)
    }
}

#Preview {
    ModelPreview { card in
        CardImage(card: card)
    }
    .modelContainer(previewModelContainer)
}
