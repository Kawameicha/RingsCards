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
            image.resizable()
        } placeholder: {
            ProgressView()
        }
        .clipShape(
            Circle().offset(y:-100))
        .overlay {
            Circle().stroke(.white, lineWidth: 4).offset(y:-100)
        }
        .shadow(radius: 9)
    }
}

struct CardImage_Previews: PreviewProvider {
    static var cards = RingsData().cards

    static var previews: some View {
        CardImage(card: cards[0])
    }
}
