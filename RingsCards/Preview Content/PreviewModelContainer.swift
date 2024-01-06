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
            for: Card.self, Deck.self, Campaign.self, Scenario.self, Pack.self, Keyword.self,
            configurations: ModelConfiguration(isStoredInMemoryOnly: true)
        )

        let modelContext = container.mainContext

        if try modelContext.fetch(FetchDescriptor<Card>()).isEmpty {
            let cards = CardJSONDecoder.decode(from: "Cards")

            cards.forEach { card in
                let card = Card(pack_code: card.pack_code,
                                pack_name: card.pack_name,
                                type_code: card.type_code,
                                type_name: card.type_name,
                                sphere_code: card.sphere_code,
                                sphere_name: card.sphere_name,
                                position: card.position,
                                code: card.code,
                                name: card.name,
                                traits: card.traits,
                                text: card.text,
                                flavor: card.flavor,
                                is_unique: card.is_unique,
                                threat: card.threat,
                                cost: card.cost,
                                willpower: card.willpower,
                                attack: card.attack,
                                defense: card.defense,
                                health: card.health,
                                quantity: card.quantity,
                                deck_limit: card.deck_limit,
                                illustrator: card.illustrator,
                                octgnid: card.octgnid,
                                has_errata: card.has_errata,
                                url: card.url,
                                imagesrc: card.imagesrc)

                // MARK: this only to used together with UserCollection
                // let userCollection = UserCollection(card: card, isInCollection: true)
                container.mainContext.insert(card)
            }

            let scenarios = ScenarioJSONDecoder.decode(from: "Scenarios")
            
            scenarios.forEach { scenario in
                let scenario = Scenario(id: scenario.id,
                                        name: scenario.name,
                                        nameCanonical: scenario.nameCanonical,
                                        pack: scenario.pack,
                                        encounters: scenario.encounters,
                                        keywords: scenario.keywords,
                                        flavorIntro: scenario.flavorIntro,
                                        ruling: scenario.ruling,
                                        doNotRead: scenario.doNotRead,
                                        easyEnemies: scenario.easy_enemies,
                                        easyLocations: scenario.easy_locations,
                                        easyTreacheries: scenario.easy_treacheries,
                                        normalEnemies: scenario.normal_enemies,
                                        normalLocations: scenario.normal_locations,
                                        normalTreacheries: scenario.normal_treacheries,
                                        nightmareEnemies: scenario.nightmare_enemies,
                                        nightmareLocations: scenario.nightmare_locations,
                                        nightmareTreacheries: scenario.nightmare_treacheries)

                container.mainContext.insert(scenario)
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
            
            if try modelContext.fetch(FetchDescriptor<Keyword>()).isEmpty {
                Keywords.contents.forEach { container.mainContext.insert($0) }
            }
        }

        return container
    } catch {
        fatalError("Failed to create container")
    }
}()
