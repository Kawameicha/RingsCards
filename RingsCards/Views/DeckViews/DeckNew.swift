//
//  DeckNew.swift
//  RingsCards
//
//  Created by Christoph Freier on 08.09.23.
//

import SwiftUI

struct DeckNew: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @EnvironmentObject var ringsData: RingsData

    @State private var deckName: String = ""

    var body: some View {
        Form {
            Section {
                TextField("New Deck Name", text: $deckName)
            }

            Section {
                HStack {
                    Spacer()
                    Button("Create Deck", action: {
                        ringsData.decks.append(Deck(name: deckName))

                        self.presentationMode.wrappedValue.dismiss()
                    })
                    Spacer()
                }
            }
        }
        .navigationTitle("New Campaign")
    }
}

struct DeckNew_Previews: PreviewProvider {
    static var previews: some View {
        DeckNew()
    }
}
