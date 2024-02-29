//
//  Scenario.swift
//  RingsCards
//
//  Created by Christoph Freier on 05.01.24.
//

import Foundation
import SwiftData

@Model
final class Scenario: Identifiable {
    @Attribute(.unique) let id: Int
    let code: String
    let name: String
    let pack: String
    let encounterSets: [EncounterSets]
    let encounterRule: [EncounterRule]
    let flavorText: FlavorText
    let statistics: Statistics

    init(id: Int, code: String, name: String, pack: String, encounterSets: [EncounterSets], encounterRule: [EncounterRule], flavorText: FlavorText, statistics: Statistics) {
        self.id = id
        self.code = code
        self.name = name
        self.pack = pack
        self.encounterSets = encounterSets
        self.encounterRule = encounterRule
        self.flavorText = flavorText
        self.statistics = statistics
    }
}

struct EncounterSets: Hashable, Codable {
    let code: String
    let name: String
}

struct EncounterRule: Hashable, Codable {
    let code: String
    let name: String
}

struct FlavorText: Hashable, Codable {
    let intro: String
    let rules: String
    let outro: String
}

struct Statistics: Hashable, Codable {
    let hasEasy: Bool
    let hasNightmare: Bool
    let easyCards: Int
    let easyEnemies: Int
    let easyLocations: Int
    let easyTreacheries: Int
    let easyShadows: Int
    let easyObjectives: Int
    let easyObjectiveAllies: Int
    let easyObjectiveLocations: Int
    let easySurges: Int
    let easyEncounterSideQuests: Int
    let normalCards: Int
    let normalEnemies: Int
    let normalLocations: Int
    let normalTreacheries: Int
    let normalShadows: Int
    let normalObjectives: Int
    let normalObjectiveAllies: Int
    let normalObjectiveLocations: Int
    let normalSurges: Int
    let normalEncounterSideQuests: Int
    let nightmareCards: Int
    let nightmareEnemies: Int
    let nightmareLocations: Int
    let nightmareTreacheries: Int
    let nightmareShadows: Int
    let nightmareObjectives: Int
    let nightmareObjectiveAllies: Int
    let nightmareObjectiveLocations: Int
    let nightmareSurges: Int
    let nightmareEncounterSideQuests: Int
}

extension Scenario {
    static func predicate(
        searchText: String,
        filterCampaign: [Int]
    ) -> Predicate<Scenario> {
        
        return #Predicate<Scenario> { scenario in
            (filterCampaign.contains(scenario.id))
            &&
            (searchText.isEmpty || scenario.name.localizedStandardContains(searchText))
        }
    }
}
