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
                                    encounterSets: scenario.encounters,
                                    encounterRule: scenario.keywords,
                                    flavorText: FlavorText(intro: scenario.flavorIntro,
                                                           rules: scenario.ruling,
                                                           outro: scenario.doNotRead),
                                    statistics: Statistics(hasEasy: scenario.has_easy,
                                                           hasNightmare: scenario.has_nightmare,
                                                           easyCards: scenario.easy_cards,
                                                           easyEnemies: scenario.easy_enemies,
                                                           easyLocations: scenario.easy_locations,
                                                           easyTreacheries: scenario.easy_treacheries,
                                                           easyShadows: scenario.easy_shadows,
                                                           easyObjectives: scenario.easy_objectives,
                                                           easyObjectiveAllies: scenario.easy_objective_allies,
                                                           easyObjectiveLocations: scenario.easy_objective_locations,
                                                           easySurges: scenario.easy_surges,
                                                           easyEncounterSideQuests: scenario.easy_encounter_side_quests,
                                                           normalCards: scenario.normal_cards,
                                                           normalEnemies: scenario.normal_enemies,
                                                           normalLocations: scenario.normal_locations,
                                                           normalTreacheries: scenario.normal_treacheries,
                                                           normalShadows: scenario.normal_shadows,
                                                           normalObjectives: scenario.normal_objectives,
                                                           normalObjectiveAllies: scenario.normal_objective_allies,
                                                           normalObjectiveLocations: scenario.normal_objective_locations,
                                                           normalSurges: scenario.normal_surges,
                                                           normalEncounterSideQuests: scenario.normal_encounter_side_quests,
                                                           nightmareCards: scenario.nightmare_cards,
                                                           nightmareEnemies: scenario.nightmare_enemies,
                                                           nightmareLocations: scenario.nightmare_locations,
                                                           nightmareTreacheries: scenario.nightmare_treacheries,
                                                           nightmareShadows: scenario.nightmare_shadows,
                                                           nightmareObjectives: scenario.nightmare_objectives,
                                                           nightmareObjectiveAllies: scenario.nightmare_objective_allies,
                                                           nightmareObjectiveLocations: scenario.nightmare_objective_locations,
                                                           nightmareSurges: scenario.nightmare_surges,
                                                           nightmareEncounterSideQuests: scenario.nightmare_encounter_side_quests))

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
