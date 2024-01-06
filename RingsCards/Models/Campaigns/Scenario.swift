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
    let name: String
    let nameCanonical: String
    let pack: String
    let encounters: [Encounter]
    let keywords: [KeywordUsed]
    let flavorIntro: String
    let ruling: String
    let doNotRead: String
    let easyEnemies: Int
    let easyLocations: Int
    let easyTreacheries: Int
    let normalEnemies: Int
    let normalLocations: Int
    let normalTreacheries: Int
    let nightmareEnemies: Int
    let nightmareLocations: Int
    let nightmareTreacheries: Int

    init(id: Int, name: String, nameCanonical: String, pack: String, encounters: [Encounter], keywords: [KeywordUsed], flavorIntro: String, ruling: String, doNotRead: String, easyEnemies: Int, easyLocations: Int, easyTreacheries: Int, normalEnemies: Int, normalLocations: Int, normalTreacheries: Int, nightmareEnemies: Int, nightmareLocations: Int, nightmareTreacheries: Int) {
        self.id = id
        self.name = name
        self.nameCanonical = nameCanonical
        self.pack = pack
        self.encounters = encounters
        self.keywords = keywords
        self.flavorIntro = flavorIntro
        self.ruling = ruling
        self.doNotRead = doNotRead
        self.easyEnemies = easyEnemies
        self.easyLocations = easyLocations
        self.easyTreacheries = easyTreacheries
        self.normalEnemies = normalEnemies
        self.normalLocations = normalLocations
        self.normalTreacheries = normalTreacheries
        self.nightmareEnemies = nightmareEnemies
        self.nightmareLocations = nightmareLocations
        self.nightmareTreacheries = nightmareTreacheries
    }
}

struct Encounter: Hashable, Codable, Identifiable {
    let id: Int
    let code: String
    let name: String
}

struct KeywordUsed: Hashable, Codable, Identifiable {
    let id: Int
    let code: String
    let name: String
}

extension Scenario {
    static func predicate(
        filterCampaign: [Int]
    ) -> Predicate<Scenario> {

        return #Predicate<Scenario> { scenario in
            (filterCampaign.contains(scenario.id))
        }
    }
}
