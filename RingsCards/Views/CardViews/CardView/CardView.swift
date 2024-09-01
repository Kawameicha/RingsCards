//
//  CardView.swift
//  RingsCards
//
//  Created by Christoph Freier on 19.08.23.
//

import SwiftUI

struct CardView: View {
    var card: Card
    let packIconMappings: [String: String] = [
        "HfG": "SoM",
        "CatC": "SoM",
        "JtR": "SoM",
        "HoEM": "SoM",
        "TDM": "SoM",
        "RtM": "SoM",
        "RevCore": "Core",
        "TRG": "D",
        "RtR": "D",
        "WitW": "D",
        "TLD": "D",
        "FoS": "D",
        "SaF": "D",
        "TSF": "AtS",
        "TDF": "AtS",
        "EaAD": "AtS",
        "AoO": "AtS",
        "BoG": "AtS",
        "TMV": "AtS",
        "TDT": "TRM",
        "TTT": "TRM",
        "TiT": "TRM",
        "NiE": "TRM",
        "CS": "TRM",
        "TAC": "TRM",
        "WoE": "AA",
        "EfMG": "AA",
        "AtE": "AA",
        "ToR": "AA",
        "BoCD": "AA",
        "TDR": "AA",
        "FotS": "DC",
        "TitD": "DC",
        "TotD": "DC",
        "DR": "DC",
        "SoCH": "DC",
        "CoC": "DC",
        "M": "H",
        "RAH": "H",
        "BtS": "H",
        "TBS": "H",
        "DoCG": "H",
        "CoP": "H",
        "TWH": "EM",
        "RAR": "EM",
        "FitN": "EM",
        "TGoF": "EM",
        "MG": "EM",
        "TFoW": "EM",
        "WaR": "VoM",
        "TCoU": "VoM",
        "CotW": "VoM",
        "UtAM": "VoM",
        "TLoS": "VoM",
        "TFoN": "VoM",
        "TAP": "OotR",
        "FotE": "OotR",
        "TGoR": "OotR",
        "TGC": "OotR",
        "MotR": "OotR",
        "BitI": "OotR",
    ]

    func getPackIcon(for packName: String) -> Image {
        if let imageName = packIconMappings[packName] {
            return Image(imageName)
        } else {
            return Image(packName)
        }
    }

    var body: some View {
        GroupBox {
            CardImage(card: card)
                .offset(y: -100)
                .padding(.bottom, -100)

            VStack(alignment: .leading, spacing: 3) {
                HStack(alignment: .center, spacing: 3) {
                    VStack(alignment: .leading, spacing: 3) {
                        HStack(alignment: .center, spacing: 3) {
                            if card.isUnique {
                                Text("\u{E607}")
                            }

                            Text(card.name)
                        }
                        .font(Font.custom("SFUIText-Regular", size: 26))

                        Text(card.texts.traits)
                            .foregroundColor(.secondary)
                            .bold()
                            .italic()
                    }

                    Spacer()

                    VStack(alignment: .center, spacing: 3) {
                        Text(.init("[\(card.sphereCode)]"
                            .iconsAndSpheres()
                        ))
                        .font(Font.custom("SFUIText-Regular", size: 26))
                        .foregroundColor((Color(card.sphereName)))

                        Text(card.typeName)
                            .foregroundColor(.secondary)
                            .bold()
                    }
                }

                HStack(alignment: .center, spacing: 3) {
                    if card.typeCode == "hero" {
                        Text("Threat:" + " \(card.costs.threat)")
                    } else if card.costs.cost != "" {
                        Text("Cost:" + " \(card.costs.cost)")
                    }

                    Spacer()

                    if ["hero", "ally"].contains(card.typeCode) {
                        HStack(alignment: .center, spacing: 3) {
                            Text("\(card.stats.willpower ?? 0)" + " \u{E600}")
                            Text("\(card.stats.attack ?? 0)" + " \u{E601}")
                            Text("\(card.stats.defense ?? 0)" + " \u{E602}")
                            Text("\(card.stats.health ?? 0)" + " \u{E603}")
                        }
                    }
                }
            }

            GeometryReader { item in
                ScrollView(.vertical, showsIndicators: false) {
                    VStack(alignment: .leading, spacing: 16) {
                        GroupBox {
                            VStack(alignment: .leading, spacing: 16) {
                                if card.texts.text != "" {
                                    Text(.init(card.texts.text
                                        .htmlToMarkDown()
                                        .iconsAndSpheres()
                                        .replacing("\n", with: "\n\n")
                                    ))
                                }

                                if card.texts.flavor != "" {
                                    Text(.init(card.texts.flavor
                                        .htmlToMarkDown()
                                    ))
                                    .fontWeight(.ultraLight)
                                    .italic()
                                }
                            }
                            .frame(maxWidth: .infinity, alignment: .leading)
                        }
                        .backgroundStyle(Color(card.sphereName))

                        HStack(alignment: .center, spacing: 3) {
                            Text("Illus. \(card.texts.illustrator)")

                            Spacer()

                            PackIcon(image: getPackIcon(for: card.packCode))
                            Text("\(card.position)")
                        }
                        .font(.footnote)
                    }
                }
                .frame(height: item.size.height)
            }
        }
        .font(Font.custom("SFUIText-Regular", size: 16))
        .offset(y: 100)
        .padding(.bottom, 100)
    }
}
