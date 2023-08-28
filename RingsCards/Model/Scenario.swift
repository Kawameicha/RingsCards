//
//  Scenario.swift
//  RingsCards
//
//  Created by Christoph Freier on 27.08.23.
//

import Foundation

struct Scenario: Hashable, Codable, Identifiable {
    var id: Int
    var code: String
    var name: String
    var nameCanonical: String
    var pack: String
    var date_creation: String
    var date_update: String
    var encounters: [Encounter]
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

struct Encounter: Hashable, Codable, Identifiable {
    var id: Int
    var code: String
    var name: String
}
