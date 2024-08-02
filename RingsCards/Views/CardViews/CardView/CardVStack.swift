//
//  CardVStack.swift
//  RingsCards
//
//  Created by Christoph Freier on 30.07.24.
//

import SwiftUI

struct CardVStack: View {
    @State var scrollPosition: String?
    var cards: [Card]
    var card: Card

    var body: some View {
        ScrollViewReader { value in
            GeometryReader { item in
                ScrollView(.horizontal, showsIndicators: false) {
                    LazyHStack(alignment: .top) {
                        ForEach(cards) { card in
                            CardView(card: card)
                                .id(card.code)
                                .frame(width: item.size.width, alignment: .center)
                                .background(
                                    GeometryReader { geometry in
                                        Color.clear
                                            .onAppear {
                                                if geometry.frame(in: .global).minX >= 0 &&
                                                    geometry.frame(in: .global).maxX <= UIScreen.main.bounds.width {
                                                    scrollPosition = card.code
                                                }
                                            }
                                    }
                                )
                                .toolbar {
                                    if scrollPosition == card.code {
                                        ToolbarItemGroup(placement: .topBarTrailing) {
                                            CardFaqButton(card: card)
                                            CardRingsButton(card: card)
                                        }

                                        ToolbarItem(placement: .status) {
                                            HStack {
                                                Text("Illus. \(card.texts.illustrator)")
                                                    .font(.footnote)
                                                Spacer()
                                                Text("\(card.packName) # \(card.position)")
                                                    .font(.footnote)
                                            }
                                        }
                                    }
                                }
                        }
                    }
                    .onAppear {
                        value.scrollTo(card.id)
                        scrollPosition = card.code
                    }
                }
                .scrollPosition(id: $scrollPosition)
                .scrollTargetLayout()
                .scrollClipDisabled()
            }
            .scrollTargetBehavior(.viewAligned)
            .safeAreaPadding(.horizontal)
        }
    }
}
