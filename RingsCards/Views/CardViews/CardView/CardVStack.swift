//
//  CardVStack.swift
//  RingsCards
//
//  Created by Christoph Freier on 30.07.24.
//

import SwiftUI

struct CardVStack: View {
    var cards: [Card]
    var card: Card

    var body: some View {
        VStack(alignment: .leading) {
            ScrollViewReader { value in
                GeometryReader { item in
                    ScrollView(.horizontal, showsIndicators: false) {
                        LazyHStack(alignment: .top) {
                            ForEach(cards) { card in
                                CardView(card: card)
                                    .frame(width: item.size.width, alignment: .center)
                            }
                        }
                        .onAppear {
                            value.scrollTo(card.id)
                        }
                    }
                    .scrollTargetLayout()
                    .scrollClipDisabled()
                }
                .scrollTargetBehavior(.viewAligned)
                .safeAreaPadding(.horizontal)
            }
        }
    }
}
