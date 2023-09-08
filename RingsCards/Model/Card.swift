//
//  Card.swift
//  RingsCards
//
//  Created by Christoph Freier on 20.08.23.
//

import Foundation

struct Card: Hashable, Codable, Identifiable {
    let id = UUID()
    var pack_code: String
    var pack_name: String
    var type_code: String
    var type_name: String
    var sphere_code: String
    var sphere_name: String
    var position: Int
    var code: String
    var name: String
    var traits: String? = nil
    var text: String? = nil
    var flavor: String? = nil
    var is_unique: Bool
    var threat: Int? = nil
    var cost: String? = nil
    var willpower: Int? = nil
    var attack: Int? = nil
    var defense: Int? = nil
    var health: Int? = nil
    var quantity: Int
    var deck_limit: Int
    var illustrator: String
    var octgnid: String
    var has_errata: Bool
    var url: String
    var imagesrc: String
}

struct CardAnatomy {
    let title: String
    let cost: Int
    let threatCost: Int
    let sphere: Sphere
    let willpower: Int
    let attack: Int
    let defense: Int
    let hitPoint: Int
    let resource: Sphere
    let traits: [String]
    let gameText: String
    let cardType: CardType
    let set: [String:Int]

    enum CardSphere: String, CaseIterable {
        case leadership, tactics, spirit, lore, neutral, baggins, fellowship
    }

    enum CardType: String, CaseIterable {
        case hero, ally, attachment, event, campaign
    }
}
