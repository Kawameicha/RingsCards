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
            for: Card.self, Deck.self, Campaign.self, Scenario.self, Pack.self, Rule.self,
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
                                code: card.code,
                                name: card.name,
                                traits: card.traits,
                                threat: card.threat,
                                cost: card.cost,
                                deck_limit: card.deck_limit,
                                cardCategory: card.cardCategory,
                                cardDetails: CardDetail(position: card.position,
                                                       text: card.text,
                                                       flavor: card.flavor,
                                                       is_unique: card.is_unique,
                                                       victory: card.victory,
                                                       quest: card.quest,
                                                       willpower:  card.willpower,
                                                       attack: card.attack,
                                                       defense: card.defense,
                                                       health: card.health,
                                                       quantity: card.quantity,
                                                       illustrator: card.illustrator,
                                                       has_errata: card.has_errata,
                                                       url: card.url,
                                                       imagesrc: card.imagesrc))

                container.mainContext.insert(card)
            }

            let scenarios = ScenarioJSONDecoder.decode(from: "Scenarios")

            scenarios.forEach { scenario in
                let scenario = Scenario(id: scenario.id,
                                        code: scenario.nameCanonical,
                                        name: scenario.name,
                                        pack: scenario.pack,
                                        encounters: scenario.encounters,
                                        keywords: scenario.keywords,
                                        flavorText: FlavorText(flavorIntro: scenario.flavorIntro,
                                                               ruling: scenario.ruling,
                                                               doNotRead: scenario.doNotRead),
                                        statistics: Statistic(easyEnemies: scenario.easy_enemies,
                                                              easyLocations: scenario.easy_locations,
                                                              easyTreacheries: scenario.easy_treacheries,
                                                              normalEnemies: scenario.normal_enemies,
                                                              normalLocations: scenario.normal_locations,
                                                              normalTreacheries: scenario.normal_treacheries,
                                                              nightmareEnemies: scenario.nightmare_enemies,
                                                              nightmareLocations: scenario.nightmare_locations,
                                                              nightmareTreacheries: scenario.nightmare_treacheries))

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

            let rules = RuleJSONDecoder.decode(from: "Rules")

            rules.forEach { rule in
                let rule = Rule(id: rule.id,
                                name: rule.name,
                                isKeyword: rule.isKeyword,
                                text: rule.text,
                                seeAlso: rule.seeAlso)

                container.mainContext.insert(rule)
            }
        }

        return container
    } catch {
        fatalError("Failed to create container")
    }
}()
