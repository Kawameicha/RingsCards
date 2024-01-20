//
//  CardView.swift
//  RingsCards
//
//  Created by Christoph Freier on 19.08.23.
//

import SwiftUI
import RegexBuilder

struct CardView: View {
    var card: Card

    var body: some View {
        List {
            CardImage(card: card)
                .offset(y: 120)
                .scaledToFill()
                .frame(height: 300)
                .clipped()
                .listRowInsets(EdgeInsets())

            VStack(alignment: .leading) {
                if card.cardDetails.is_unique == true {
                    Text("\u{E607} " + card.name)
                        .font(Font.custom("SFUIText-Regular", size: 28))
                } else {
                    Text(card.name)
                        .font(Font.custom("SFUIText-Regular", size: 28))
                }

                HStack {
                    Text(card.traits)
                    Spacer()
                    Text(card.type_name)
                }
                .font(.subheadline)
                .foregroundColor(.secondary)

                HStack(alignment: .center, spacing: 20) {
                    if card.type_code == "hero" {
                        Text("Threat:" + " \(card.threat ?? 0)")
                            .font(Font.custom("SFUIText-Regular", size: 20))
                    }
                    if card.cost != nil {
                        Text("Cost:" + " \(card.cost ?? "")")
                            .font(Font.custom("SFUIText-Regular", size: 20))
                    }
                    if card.cardDetails.health != 0 {
                        Text("\(card.cardDetails.willpower ?? 0)" + " \u{E600}")
                            .font(Font.custom("SFUIText-Regular", size: 20))
                        Text("\(card.cardDetails.attack ?? 0)" + " \u{E601}")
                            .font(Font.custom("SFUIText-Regular", size: 20))
                        Text("\(card.cardDetails.defense ?? 0)" + " \u{E602}")
                            .font(Font.custom("SFUIText-Regular", size: 20))
                        Text("\(card.cardDetails.health ?? 0)" + " \u{E603}")
                            .font(Font.custom("SFUIText-Regular", size: 20))
                    }
                }
                .frame(maxWidth: .infinity)

                Divider()

                GroupBox {
                    VStack(alignment: .leading, spacing: 20) {
                        if card.cardDetails.text != "" {
                            Text(.init(card.cardDetails.text
                                .htmlToMarkDown()
                                .iconsAndSpheres()
                            ))
                            .font(Font.custom("SFUIText-Regular", size: 16))
                        }

                        if card.cardDetails.flavor != "" {
                            Text(.init(card.cardDetails.flavor
                                .htmlToMarkDown()
                            ))
                            .font(.system(size: 14, weight: .light, design: .serif))
                            .italic()
                        }

                        HStack {
                            Text("Illus. \(card.cardDetails.illustrator)")
                                .font(.footnote)
                            Spacer()
                            Text("\(card.pack_name) # \(card.cardDetails.position)")
                                .font(.footnote)
                        }
                    }
                    .frame(maxWidth: .infinity)
                }
                .backgroundStyle(Color(card.sphere_name))
            }
//            .padding()
        }
    }
}

#Preview {
    ModelPreview { card in
        CardView(card: card)
    }
    .modelContainer(previewModelContainer)
}
