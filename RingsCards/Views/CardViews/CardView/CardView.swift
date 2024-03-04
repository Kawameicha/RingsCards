//
//  CardView.swift
//  RingsCards
//
//  Created by Christoph Freier on 19.08.23.
//

import SwiftUI

struct CardView: View {
    @State private var isTapped = false
    var card: Card

    var body: some View {
        List {
            if isTapped{
                CardImage(card: card)
                    .aspectRatio(contentMode: .fill)
                    .frame(alignment: .top)
                    .listRowInsets(EdgeInsets())
                    .onTapGesture {
                        isTapped.toggle()
                    }
            } else {
                CardImage(card: card)
                    .aspectRatio(contentMode: .fill)
                    .frame(height: 300, alignment: .top)
                    .listRowInsets(EdgeInsets())
                    .onTapGesture {
                        isTapped.toggle()
                    }

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
                        if card.stats.health != 0 {
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
                    .frame(maxWidth: .infinity)

                    Divider()

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
                }
            }
        }
    }
}

#Preview {
    ModelPreview { card in
        CardView(card: card)
    }
    .modelContainer(previewModelContainer)
}
