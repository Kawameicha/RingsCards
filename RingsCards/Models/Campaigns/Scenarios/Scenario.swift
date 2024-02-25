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

struct EncounterSets: Hashable, Codable, Identifiable {
    let id: Int
    let code: String
    let name: String
}

struct EncounterRule: Hashable, Codable, Identifiable {
    let id: Int
    let code: String
    let name: String
}

struct FlavorText: Hashable, Codable {
    let intro: String
    let rules: String
    let outro: String
}

struct Statistics: Hashable, Codable {
    var hasEasy: Bool
    var hasNightmare: Bool
    var easyCards: Int
    let easyEnemies: Int
    let easyLocations: Int
    let easyTreacheries: Int
    var easyShadows: Int
    var easyObjectives: Int
    var easyObjectiveAllies: Int
    var easyObjectiveLocations: Int
    var easySurges: Int
    var easyEncounterSideQuests: Int
    var normalCards: Int
    let normalEnemies: Int
    let normalLocations: Int
    let normalTreacheries: Int
    var normalShadows: Int
    var normalObjectives: Int
    var normalObjectiveAllies: Int
    var normalObjectiveLocations: Int
    var normalSurges: Int
    var normalEncounterSideQuests: Int
    var nightmareCards: Int
    let nightmareEnemies: Int
    let nightmareLocations: Int
    let nightmareTreacheries: Int
    var nightmareShadows: Int
    var nightmareObjectives: Int
    var nightmareObjectiveAllies: Int
    var nightmareObjectiveLocations: Int
    var nightmareSurges: Int
    var nightmareEncounterSideQuests: Int
}

extension Scenario {
    static func predicate(
        filterCampaign: [Int],
        searchText: String = ""
    ) -> Predicate<Scenario> {
        
        return #Predicate<Scenario> { scenario in
            (filterCampaign.contains(scenario.id))
            &&
            (searchText.isEmpty || scenario.name.localizedStandardContains(searchText))
        }
    }
}
