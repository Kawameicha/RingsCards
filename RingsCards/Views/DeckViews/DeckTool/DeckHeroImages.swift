//
//  DeckHeroImages.swift
//  RingsCards
//
//  Created by Christoph Freier on 25.06.24.
//

import SwiftUI

struct DeckHeroImages: View {
    let heroes: [String]
    let maxDisplayCount: Int = 4

    var body: some View {
        GeometryReader { geometry in
            HStack(spacing: 0) {
                if heroes.isEmpty {
                    Image("emptyDeck")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .opacity(0.7)
                } else {
                    ForEach(heroes.prefix(maxDisplayCount), id: \.self) { hero in
                        Image(hero)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: geometry.size.width / CGFloat(min(heroes.count, maxDisplayCount)), height: geometry.size.height)
                            .clipShape(Rectangle())
                            .opacity(0.7)
                    }
                }
            }
        }
    }
}

//#Preview {
//    DeckHeroImages(heroes: ["01001", "01002", "01003"])
//}
