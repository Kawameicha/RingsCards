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
    @State private var showSheet = false
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
            let source = errata.first?.isOfficial == true ? "official" : "ALeP"

            Button(action: {
                showSheet = true
            }) {
                Image(systemName: "info.circle")
            }
            .sheet(isPresented: $showSheet) {
                VStack(alignment: .center) {
                    Text("This card was subject to \(source) errata")
                        .font(.title)
                        .fontWeight(.bold)
                        .padding(.horizontal, 20)
                        .padding(.vertical, 10)

                    Text(.init("\(errata.first?.text ?? "")"
                        .iconsAndSpheres()
                    ))
                    .font(Font.custom("SFUIText-Regular", size: 16))
                    .padding()

                    Spacer()
                }
                .presentationDetents([.medium])
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
