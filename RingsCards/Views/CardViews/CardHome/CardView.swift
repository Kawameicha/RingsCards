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
        ScrollView {
            CardImage(card: card)
                .offset(y: -100)
                .padding(.bottom, -200)

            VStack(alignment: .leading) {
                if card.is_unique == true {
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
                    if card.threat != nil {
                        Text("Threat:" + " \(card.threat ?? 0)")
                            .font(Font.custom("SFUIText-Regular", size: 20))
                    }
                    if card.cost != nil {
                        Text("Cost:" + " \(card.cost ?? "")")
                            .font(Font.custom("SFUIText-Regular", size: 20))
                    }
                    if card.willpower != nil {
                        Text("\(card.willpower ?? 0)" + " \u{E600}")
                            .font(Font.custom("SFUIText-Regular", size: 20))
                    }
                    if card.attack != nil {
                        Text("\(card.attack ?? 0)" + " \u{E601}")
                            .font(Font.custom("SFUIText-Regular", size: 20))
                    }
                    if card.defense != nil {
                        Text("\(card.defense ?? 0)" + " \u{E602}")
                            .font(Font.custom("SFUIText-Regular", size: 20))
                    }
                    if card.health != nil {
                        Text("\(card.health ?? 0)" + " \u{E603}")
                            .font(Font.custom("SFUIText-Regular", size: 20))
                    }
                }
                .frame(maxWidth: .infinity)

                Divider()

                GroupBox {
                    VStack(alignment: .leading, spacing: 20) {
                        if card.text != "" {
                            Text(.init(card.text
                                .htmlToMarkDown()
                                .iconsAndSpheres()
                            ))
                            .font(Font.custom("SFUIText-Regular", size: 16))
                        }

                        if card.flavor != "" {
                            Text(.init(card.flavor
                                .htmlToMarkDown()
                            ))
                            .font(.system(size: 14, weight: .light, design: .serif))
                            .italic()
                        }

                        HStack {
                            Text("Illus. \(card.illustrator)")
                                .font(.footnote)
                            Spacer()
                            Text("\(card.pack_name) # \(card.position)")
                                .font(.footnote)
                        }
                    }
                    .frame(maxWidth: .infinity)
                }
                .backgroundStyle(Color(card.sphere_name))
            }
            .padding()
        }
//        .background(LinearGradient(
//            colors: [Color(card.sphere_name), Color.white],
//            startPoint: .top, endPoint: .center))
    }
}

#Preview {
    ModelPreview { card in
        CardView(card: card)
    }
    .modelContainer(previewModelContainer)
}
