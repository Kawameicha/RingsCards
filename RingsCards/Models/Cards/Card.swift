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
    let is_unique: Bool
    let quantity: Int
    let deck_limit: Int
    let cardSort: Int
    let costs: CardCost
    let stats: CardStat
    let texts: CardText

    init(pack_code: String, pack_name: String, type_code: String, type_name: String, sphere_code: String, sphere_name: String, position: Int, code: String, name: String, is_unique: Bool, quantity: Int, deck_limit: Int, cardSort: Int, costs: CardCost, stats: CardStat, texts: CardText) {
        self.pack_code = pack_code
        self.pack_name = pack_name
        self.type_code = type_code
        self.type_name = type_name
        self.sphere_code = sphere_code
        self.sphere_name = sphere_name
        self.position = position
        self.code = code
        self.name = name
        self.is_unique = is_unique
        self.quantity = quantity
        self.deck_limit = deck_limit
        self.cardSort = cardSort
        self.costs = costs
        self.stats = stats
        self.texts = texts
    }
}

struct CardCost: Hashable, Codable {
    var cost: String
    var threat: Int
    var engagement: String

    init(cost: String? = "", threat: Int? = -1, engagement: String? = "") {
        self.cost = cost ?? ""
        self.threat = threat ?? -1
        self.engagement = engagement ?? ""
    }
}

struct CardStat: Hashable, Codable {
    var willpower: Int? = nil
    var attack: Int? = nil
    var defense: Int? = nil
    var health: Int? = nil
    var threat: Int? = nil
    var quest: Int? = nil
    var victory: Int? = nil

    init(willpower: Int? = nil, attack: Int? = nil, defense: Int? = nil, health: Int? = nil, threat: Int? = nil, quest: Int? = nil, victory: Int? = nil) {
        self.willpower = willpower
        self.attack = attack
        self.defense = defense
        self.health = health
        self.threat = threat
        self.quest = quest
        self.victory = victory
    }
}

struct CardText: Hashable, Codable {
    var traits: String
    var text: String
    var flavor: String
    var shadow: String
    var encounterSet: String
    var illustrator: String
    var has_errata: Bool
    var url: String
    var imagesrc: String

    init(traits: String? = "", text: String? = "", flavor: String? = "", shadow: String? = "", encounterSet: String? = "", illustrator: String? = "", has_errata: Bool? = false, url: String? = "", imagesrc: String? = "") {
        self.traits = traits ?? ""
        self.text = text ?? ""
        self.flavor = flavor ?? ""
        self.shadow = shadow ?? ""
        self.encounterSet = encounterSet ?? ""
        self.illustrator = illustrator ?? ""
        self.has_errata = has_errata ?? false
        self.url = url ?? ""
        self.imagesrc = imagesrc ?? ""
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
                (filterType == "all types" || card.type_name == filterType)
                &&
                (filterSphere == "all spheres" || card.sphere_code == filterSphere)
                &&
                (searchText.isEmpty || card.name.localizedStandardContains(searchText))
            } else {
                (filterDeck.contains(card.code))
                &&
                (searchText.isEmpty || card.name.localizedStandardContains(searchText))
            }
        }
    }
}
