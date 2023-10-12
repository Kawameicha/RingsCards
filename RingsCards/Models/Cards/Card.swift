//
//  Card.swift
//  RingsCards
//
//  Created by Christoph Freier on 20.08.23.
//

import Foundation
import SwiftData

@Model
final class Card: Identifiable {
    var pack_code: String
    var pack_name: String
    var type_code: String
    var type_name: String
    var sphere_code: String
    var sphere_name: String
    var position: Int
    @Attribute(.unique) var code: String
    var name: String
    var traits: String? = nil
    var text: String? = nil
    var flavor: String? = nil
    var is_unique: Bool
    var threat: Int? = nil
    var cost: String? = nil
    var victory: Int? = nil
    var quest: Int? = nil
    var willpower: Int? = nil
    var attack: Int? = nil
    var defense: Int? = nil
    var health: Int? = nil
    var quantity: Int
    var deck_limit: Int
    var illustrator: String? = nil
    var octgnid: String? = nil
    var has_errata: Bool
    var url: String
    var imagesrc: String
    var isInCollection: Bool = false

    init(pack_code: String, pack_name: String, type_code: String, type_name: String, sphere_code: String, sphere_name: String, position: Int, code: String, name: String, traits: String? = nil, text: String? = nil, flavor: String? = nil, is_unique: Bool, threat: Int? = nil, cost: String? = nil, victory: Int? = nil, quest: Int? = nil, willpower: Int? = nil, attack: Int? = nil, defense: Int? = nil, health: Int? = nil, quantity: Int, deck_limit: Int, illustrator: String? = nil, octgnid: String? = nil, has_errata: Bool, url: String, imagesrc: String) {
        self.pack_code = pack_code
        self.pack_name = pack_name
        self.type_code = type_code
        self.type_name = type_name
        self.sphere_code = sphere_code
        self.sphere_name = sphere_name
        self.position = position
        self.code = code
        self.name = name
        self.traits = traits
        self.text = text
        self.flavor = flavor
        self.is_unique = is_unique
        self.threat = threat
        self.cost = cost
        self.victory = victory
        self.quest = quest
        self.willpower = willpower
        self.attack = attack
        self.defense = defense
        self.health = health
        self.quantity = quantity
        self.deck_limit = deck_limit
        self.illustrator = illustrator
        self.octgnid = octgnid
        self.has_errata = has_errata
        self.url = url
        self.imagesrc = imagesrc
    }
}

extension Card {
    static func predicate(
        searchText: String,
        filterSphere: FilterSphere.RawValue,
        filterType: FilterType.RawValue
    ) -> Predicate<Card> {

        return #Predicate<Card> { card in
            (card.isInCollection)
            &&
            (searchText.isEmpty || card.name.contains(searchText))
            &&
            (filterSphere.contains("all") || card.sphere_code.contains(filterSphere))
            &&
            (filterType.contains("any") || card.type_code.contains(filterType))
        }
    }
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

struct Sphere: Hashable, Identifiable {
    let id = UUID()
    let name: String
    var filterIn = true
}
