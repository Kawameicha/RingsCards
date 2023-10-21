//
//  PreviewModelContainer.swift
//  RingsCards
//
//  Created by Christoph Freier on 26.09.23.
//

import SwiftData

@MainActor
let previewModelContainer: ModelContainer = {
    do {
        let container = try ModelContainer(
            for: Card.self, Deck.self, Campaign.self, Pack.self,
            configurations: ModelConfiguration(isStoredInMemoryOnly: true)
        )

        let modelContext = container.mainContext

        if try modelContext.fetch(FetchDescriptor<Card>()).isEmpty {
            let cards = CardJSONDecoder.decode(from: "Cards")

            cards.forEach { item in
                let card = Card(pack_code: item.pack_code,
                                pack_name: item.pack_name,
                                type_code: item.type_code,
                                type_name: item.type_name,
                                sphere_code: item.sphere_code,
                                sphere_name: item.sphere_name,
                                position: item.position,
                                code: item.code,
                                name: item.name,
                                traits: item.traits,
                                text: item.text,
                                flavor: item.flavor,
                                is_unique: item.is_unique,
                                threat: item.threat,
                                cost: item.cost,
                                willpower: item.willpower,
                                attack: item.attack,
                                defense: item.defense,
                                health: item.health,
                                quantity: item.quantity,
                                deck_limit: item.deck_limit,
                                illustrator: item.illustrator,
                                octgnid: item.octgnid,
                                has_errata: item.has_errata,
                                url: item.url,
                                imagesrc: item.imagesrc)
                    container.mainContext.insert(card)
            }

            if try modelContext.fetch(FetchDescriptor<Deck>()).isEmpty {
                SampleDeck.contents.forEach { container.mainContext.insert($0) }
            }

            if try modelContext.fetch(FetchDescriptor<Campaign>()).isEmpty {
                SampleCampaign.contents.forEach { container.mainContext.insert($0) }
            }

            if try modelContext.fetch(FetchDescriptor<Pack>()).isEmpty {
                Packs.contents.forEach { container.mainContext.insert($0) }
            }
        }

        return container
    } catch {
        fatalError("Failed to create container")
    }
}()
