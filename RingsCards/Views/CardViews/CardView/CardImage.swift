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
        AsyncImage(url: URL(string: "https://www.ringsdb.com\(card.texts.imagesrc)")) { phase in
            switch phase {
            case .empty:
                ProgressView()
                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .center)
            case .success(let image):
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            case .failure:
                Image(systemName: "AppIcon")
            @unknown default:
                EmptyView()
            }
        }
    }
}

#Preview {
    ModelPreview { card in
        CardImage(card: card)
    }
    .modelContainer(previewModelContainer)
}
