//
//  CardErratum.swift
//  RingsCards
//
//  Created by Christoph Freier on 15.02.24.
//

import SwiftUI
import SwiftData

struct CardErratum: View {
    @Query var errata: [Erratum]
    var card: Card

    init(
        card: Card
    ) {
        self.card = card

        let code = card.code
        _errata = Query(filter: #Predicate<Erratum> { erratum in
            erratum.code == code})
    }

    var body: some View {
        if !errata.isEmpty {
            ForEach(errata) { erratum in
                if erratum.isOfficial {
                    GroupBox(
                        label: Label("Official Erratum", systemImage: "exclamationmark.bubble")
                            .foregroundColor(.red)
                    ) {
                        Text(.init(erratum.text
                            .iconsAndSpheres()
                        ))
                        .font(Font.custom("SFUIText-Regular", size: 16))
                    }
                    .groupBoxStyle(PlainGroupBoxStyle())
                } else {
                    GroupBox(
                        label: Label("ALeP Erratum", systemImage: "exclamationmark.bubble")
                            .foregroundColor(.red)
                    ) {
                        Text(.init(erratum.text
                            .iconsAndSpheres()
                        ))
                        .font(Font.custom("SFUIText-Regular", size: 16))
                    }
                    .groupBoxStyle(PlainGroupBoxStyle())
                }
            }
        }
    }
}
