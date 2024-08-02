//
//  CardFaqButton.swift
//  RingsCards
//
//  Created by Christoph Freier on 02.08.24.
//

import SwiftUI
import SwiftData

struct CardFaqButton: View {
    @Query var errata: [Erratum]
    @State private var showAlert = false
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
            let source = if errata.first?.isOfficial == true {
                "official"
            } else {
                "ALeP"
            }

            Button(action: {
                showAlert = true
            }) {
                Image(systemName: "info.circle")
            }
            .alert(isPresented: $showAlert) {
                Alert(
                    title: Text("This card was subject to \(source) errata"),
                    message: Text(.init("\(errata.first?.text ?? "")"
                        .iconsAndSpheres()
                    ))
                    .font(Font.custom("SFUIText-Regular", size: 16)),
                    dismissButton: .default(Text("OK"))
                )
            }
        } else {
            EmptyView()
        }
    }
}

//#Preview {
//    ModelPreview { card in
//        CardFaqButton(card: card)
//    }
//    .modelContainer(previewModelContainer)
//}
