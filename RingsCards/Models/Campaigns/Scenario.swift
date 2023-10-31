//
//  Scenario.swift
//  RingsCards
//
//  Created by Christoph Freier on 27.08.23.
//

import Foundation

struct Scenario: Hashable, Codable, Identifiable {
    let id: Int
    let code: String
    let name: String
    let nameCanonical: String
    let pack: String
    let date_creation: String
    let date_update: String
    let encounters: [Encounter]
    let keywords: [KeywordUsed]
    let flavorIntro: String
    var ruling: String? = ""
    let doNotRead: String
    let has_easy: Bool
    let has_nightmare: Bool
    let easy_cards: Int
    let easy_enemies: Int
    let easy_locations: Int
    let easy_treacheries: Int
    let easy_shadows: Int
    let easy_objectives: Int
    let easy_objective_allies: Int
    let easy_objective_locations: Int
    let easy_surges: Int
    let easy_encounter_side_quests: Int
    let normal_cards: Int
    let normal_enemies: Int
    let normal_locations: Int
    let normal_treacheries: Int
    let normal_shadows: Int
    let normal_objectives: Int
    let normal_objective_allies: Int
    let normal_objective_locations: Int
    let normal_surges: Int
    let normal_encounter_side_quests: Int
    let nightmare_cards: Int
    let nightmare_enemies: Int
    let nightmare_locations: Int
    let nightmare_treacheries: Int
    let nightmare_shadows: Int
    let nightmare_objectives: Int
    let nightmare_objective_allies: Int
    let nightmare_objective_locations: Int
    let nightmare_surges: Int
    let nightmare_encounter_side_quests: Int
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
