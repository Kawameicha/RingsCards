//
//  ScenarioDecoder.swift
//  RingsCards
//
//  Created by Christoph Freier on 05.01.24.
//

import Foundation
import SwiftData

struct ScenarioResponse: Decodable {
    var id: Int
    var code: String
    var name: String
    var pack: String
    var nameCanonical: String
    var date_creation: String
    var date_update: String
    var encounters: [Encounter]
    var keywords: [KeywordUsed]
    var flavorIntro: String
    var ruling: String
    var doNotRead: String
    var has_easy: Bool
    var has_nightmare: Bool
    var easy_cards: Int
    var easy_enemies: Int
    var easy_locations: Int
    var easy_treacheries: Int
    var easy_shadows: Int
    var easy_objectives: Int
    var easy_objective_allies: Int
    var easy_objective_locations: Int
    var easy_surges: Int
    var easy_encounter_side_quests: Int
    var normal_cards: Int
    var normal_enemies: Int
    var normal_locations: Int
    var normal_treacheries: Int
    var normal_shadows: Int
    var normal_objectives: Int
    var normal_objective_allies: Int
    var normal_objective_locations: Int
    var normal_surges: Int
    var normal_encounter_side_quests: Int
    var nightmare_cards: Int
    var nightmare_enemies: Int
    var nightmare_locations: Int
    var nightmare_treacheries: Int
    var nightmare_shadows: Int
    var nightmare_objectives: Int
    var nightmare_objective_allies: Int
    var nightmare_objective_locations: Int
    var nightmare_surges: Int
    var nightmare_encounter_side_quests: Int
}

struct ScenarioJSONDecoder {
    static func decode(from fileName: String) -> [ScenarioResponse] {

        guard let url = Bundle.main.url(forResource: fileName, withExtension: "json"),
              let data = try? Data(contentsOf: url),
              let scenarios = try? JSONDecoder().decode([ScenarioResponse].self, from: data) else {
            return []
        }

        return scenarios
    }
}
