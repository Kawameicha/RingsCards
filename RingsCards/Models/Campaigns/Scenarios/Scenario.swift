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
    let encounters: [Encounter]
    let keywords: [KeywordUsed]
    let flavorText: FlavorText
    let statistics: Statistic

    init(id: Int, code: String, name: String, pack: String, encounters: [Encounter], keywords: [KeywordUsed], flavorText: FlavorText, statistics: Statistic) {
        self.id = id
        self.code = code
        self.name = name
        self.pack = pack
        self.encounters = encounters
        self.keywords = keywords
        self.flavorText = flavorText
        self.statistics = statistics
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

struct FlavorText: Hashable, Codable {
    let flavorIntro: String
    let ruling: String
    let doNotRead: String
}

struct Statistic: Hashable, Codable {
    let easyEnemies: Int
    let easyLocations: Int
    let easyTreacheries: Int
    let normalEnemies: Int
    let normalLocations: Int
    let normalTreacheries: Int
    let nightmareEnemies: Int
    let nightmareLocations: Int
    let nightmareTreacheries: Int
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
