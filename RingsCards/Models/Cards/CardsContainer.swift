//
//  CardsContainer.swift
//  RingsCards
//
//  Created by Christoph Freier on 28.09.23.
//

import Foundation
import SwiftData

@Model
final class Cards: Identifiable {
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

    init(pack_code: String, pack_name: String, type_code: String, type_name: String, sphere_code: String, sphere_name: String, position: Int, code: String, name: String, traits: String? = nil, text: String? = nil, flavor: String? = nil, is_unique: Bool, threat: Int? = nil, cost: String? = nil, willpower: Int? = nil, attack: Int? = nil, defense: Int? = nil, health: Int? = nil, quantity: Int, deck_limit: Int, illustrator: String, octgnid: String, has_errata: Bool, url: String, imagesrc: String) {
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
