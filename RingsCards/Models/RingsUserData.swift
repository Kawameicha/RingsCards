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
            for: Card.self, Deck.self, Campaign.self, Scenario.self, Erratum.self, Pack.self, Rule.self,
            configurations: ModelConfiguration(isStoredInMemoryOnly: false)
        )

        let modelContext = container.mainContext

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

        let errata = ErratumJSONDecoder.decode(from: "Errata")

        errata.forEach { erratum in
            let erratum = Erratum(id: erratum.id,
                                  code: erratum.code,
                                  isOfficial: erratum.isOfficial,
                                  text: erratum.text)

            container.mainContext.insert(erratum)
        }

        let collection = try modelContext.fetch(FetchDescriptor<Pack>()).map { $0.id }
        let packs = PackJSONDecoder.decode(from: "Packs")

        packs.forEach { pack in
            let pack = Pack(id: pack.id,
                            packName: pack.packName,
                            packCode: pack.packCode,
                            packSort: pack.packSort,
                            cycleName: pack.cycleName,
                            cycleCode: pack.cycleCode,
                            cycleSort: pack.cycleSort,
                            isCycle: pack.isCycle)

            if !collection.contains(pack.id) {
                container.mainContext.insert(pack)
            }
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

        return container
    } catch {
        fatalError("Failed to create container")
    }
}()
