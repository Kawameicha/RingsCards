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
    let pack_code: String
    let pack_name: String
    let type_code: String
    let type_name: String
    let sphere_code: String
    let sphere_name: String
    let position: Int
    @Attribute(.unique) let code: String
    let name: String
    let traits: String
    let text: String
    let flavor: String
    let is_unique: Bool
    let threat: Int? = nil
    let cost: String? = nil
    let victory: Int? = nil
    let quest: Int? = nil
    let willpower: Int? = nil
    let attack: Int? = nil
    let defense: Int? = nil
    let health: Int? = nil
    let quantity: Int
    let deck_limit: Int
    let illustrator: String
    let octgnid: String
    let has_errata: Bool
    let url: String
    let imagesrc: String
    var userCollection: UserCollection?

    init(pack_code: String, pack_name: String, type_code: String, type_name: String, sphere_code: String, sphere_name: String, position: Int, code: String, name: String, traits: String?, text: String?, flavor: String?, is_unique: Bool, threat: Int? = nil, cost: String? = nil, victory: Int? = nil, quest: Int? = nil, willpower: Int? = nil, attack: Int? = nil, defense: Int? = nil, health: Int? = nil, quantity: Int, deck_limit: Int, illustrator: String?, octgnid: String?, has_errata: Bool, url: String, imagesrc: String, userCollection: UserCollection? = nil) {
        self.pack_code = pack_code
        self.pack_name = pack_name
        self.type_code = type_code
        self.type_name = type_name
        self.sphere_code = sphere_code
        self.sphere_name = sphere_name
        self.position = position
        self.code = code
        self.name = name
        self.traits = traits ?? ""
        self.text = text ?? ""
        self.flavor = flavor ?? ""
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
        self.illustrator = illustrator ?? ""
        self.octgnid = octgnid ?? ""
        self.has_errata = has_errata
        self.url = url
        self.imagesrc = imagesrc
        self.userCollection = userCollection
    }
}

enum CardType: String, CaseIterable {
    case hero, ally, attachment, event, quest = "player side quest", contract, campaign
    var id: Self { self }
    var name: String { rawValue.capitalized }
}

extension Card {
    static func predicate(
        searchText: String,
        filterSphere: FilterSphere.RawValue,
        filterType: FilterType.RawValue,
        filterPack: [String],
        filterDeck: [String]
    ) -> Predicate<Card> {

        return #Predicate<Card> { card in
            if filterDeck.isEmpty {
                (filterPack.isEmpty || filterPack.contains(card.pack_code))
                &&
                (filterType == "any" || card.type_name == filterType)
                &&
                (filterSphere == "all" || card.sphere_code == filterSphere)
                &&
                (searchText.isEmpty || card.name.localizedStandardContains(searchText))
            } else {
                (filterDeck.contains(card.code))
            }
        }
    }
}
