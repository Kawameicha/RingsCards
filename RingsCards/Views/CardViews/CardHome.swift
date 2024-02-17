//
//  CardHome.swift
//  RingsCards
//
//  Created by Christoph Freier on 20.08.23.
//

import SwiftUI
import SwiftData

struct CardHome: View {
    @Environment(ViewCardModel.self) var viewCardModel
    @Environment(\.modelContext) var modelContext
    @Query(filter: #Predicate<Pack> { pack in
        pack.isInCollection }) var packs: [Pack]
    @Query var cards: [Card]
//    @State var cardList = false

    init() {
        var descriptor: FetchDescriptor<Card> {
            var descriptor = FetchDescriptor<Card>()
            descriptor.fetchLimit = 1
            return descriptor
        }
        _cards = Query(descriptor)
    }
    
    var body: some View {
        @Bindable var viewCardModel = viewCardModel

        Group {
            if cards.count != 0 {
                CardList(
                    filterPack: packs.map { $0.packCode },
                    filterDeck: []
                )
                .refreshable {
                    await CardResponse.refresh(modelContext: modelContext)
                }
                .navigationTitle("Player Cards")
                .disableAutocorrection(true)
            } else {
                ScrollView {
                    Spacer(minLength: 200)
                    ContentUnavailableView("Refresh to load some cards", systemImage: "rectangle.portrait.on.rectangle.portrait.angled")
                }
                .refreshable {
                    await CardResponse.refresh(modelContext: modelContext)
                }
                .navigationTitle("Player Cards")
            }
        }
        .onAppear {
//            cardList = true
            viewCardModel.listOffset = 1
        }
        .onDisappear {
//            cardList = false
            viewCardModel.listOffset = 1
        }
    }
}

#Preview {
    CardHome()
        .modelContainer(previewModelContainer)
        .environment(ViewCardModel())
        .environment(ViewDeckModel())
}
