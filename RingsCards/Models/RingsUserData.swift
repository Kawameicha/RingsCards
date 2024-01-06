//
//  RingsUserData.swift
//  RingsCards
//
//  Created by Christoph Freier on 26.09.23.
//

import SwiftData

@MainActor
let ringsUserData: ModelContainer = {
    do {
        let container = try ModelContainer(
            for: Card.self, Deck.self, Campaign.self, Scenario.self, Pack.self, Keyword.self,
            configurations: ModelConfiguration(isStoredInMemoryOnly: false)
        )

        let modelContext = container.mainContext

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

        if try modelContext.fetch(FetchDescriptor<Pack>()).isEmpty {
            Packs.contents.forEach { container.mainContext.insert($0) }
        }

        Keywords.contents.forEach { container.mainContext.insert($0) }

        return container
    } catch {
        fatalError("Failed to create container")
    }
}()
