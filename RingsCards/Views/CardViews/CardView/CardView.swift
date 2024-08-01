//
//  CardView.swift
//  RingsCards
//
//  Created by Christoph Freier on 19.08.23.
//

import SwiftUI

struct CardView: View {
    var card: Card

    var body: some View {
        GroupBox {
            CardImage(card: card)
                .offset(y: -100)
                .padding(.bottom, -100)

            VStack(alignment: .leading) {
                if card.isUnique == true {
                    Text("\u{E607} " + card.name)
                        .font(Font.custom("SFUIText-Regular", size: 28))
                } else {
                    Text(card.name)
                        .font(Font.custom("SFUIText-Regular", size: 28))
                }

                HStack {
                    Text(card.texts.traits)
                    Spacer()
                    Text(card.typeName)
                }
                .font(.subheadline)
                .foregroundColor(.secondary)

                HStack(alignment: .center, spacing: 20) {
                    if card.typeCode == "hero" {
                        Text("Threat:" + " \(card.costs.threat)")
                            .font(Font.custom("SFUIText-Regular", size: 20))
                    }
                    if card.costs.cost != "" {
                        Text("Cost:" + " \(card.costs.cost)")
                            .font(Font.custom("SFUIText-Regular", size: 20))
                    }
                    if card.typeCode == "hero" || card.typeCode == "ally" {
                        Text("\(card.stats.willpower ?? 0)" + " \u{E600}")
                            .font(Font.custom("SFUIText-Regular", size: 20))
                        Text("\(card.stats.attack ?? 0)" + " \u{E601}")
                            .font(Font.custom("SFUIText-Regular", size: 20))
                        Text("\(card.stats.defense ?? 0)" + " \u{E602}")
                            .font(Font.custom("SFUIText-Regular", size: 20))
                        Text("\(card.stats.health ?? 0)" + " \u{E603}")
                            .font(Font.custom("SFUIText-Regular", size: 20))
                    }
                }
            }

            GeometryReader { item in
                ScrollView(.vertical, showsIndicators: false) {
                    VStack(spacing: 20) {
                        GroupBox {
                            VStack(alignment: .leading, spacing: 20) {
                                if card.texts.text != "" {
                                    Text(.init(card.texts.text
                                        .htmlToMarkDown()
                                        .iconsAndSpheres()
                                    ))
                                    .font(Font.custom("SFUIText-Regular", size: 16))
                                }

                                if card.texts.flavor != "" {
                                    Text(.init(card.texts.flavor
                                        .htmlToMarkDown()
                                    ))
                                    .font(.system(size: 14, weight: .light, design: .serif))
                                    .italic()
                                }

                                HStack {
                                    Text("Illus. \(card.texts.illustrator)")
                                        .font(.footnote)
                                    Spacer()
                                    Text("\(card.packName) # \(card.position)")
                                        .font(.footnote)
                                }
                            }
                            .frame(maxWidth: .infinity)
                        }
                        .backgroundStyle(Color(card.sphereName))

                        CardErratum(card: card)

                        HStack {
                            Text(.init("See on [RingsDB](\(card.texts.url)) "))
                            Text("\u{E60D}")
                                .font(Font.custom("SFUIText-Regular", size: 20))
                        }
                    }
                }
                .frame(height: item.size.height)
            }
        }
    }
}
