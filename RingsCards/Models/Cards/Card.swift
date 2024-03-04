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
    let packCode: String
    let packName: String
    let typeCode: String
    let typeName: String
    let sphereCode: String
    let sphereName: String
    let position: Int
    @Attribute(.unique) let code: String
    let name: String
    let isUnique: Bool
    let quantity: Int
    let deckLimit: Int
    let cardSort: Int
    let costs: CardCost
    let stats: CardStat
    let texts: CardText

    init(packCode: String, packName: String, typeCode: String, typeName: String, sphereCode: String, sphereName: String, position: Int, code: String, name: String, isUnique: Bool, quantity: Int, deckLimit: Int, cardSort: Int, costs: CardCost, stats: CardStat, texts: CardText) {
        self.packCode = packCode
        self.packName = packName
        self.typeCode = typeCode
        self.typeName = typeName
        self.sphereCode = sphereCode
        self.sphereName = sphereName
        self.position = position
        self.code = code
        self.name = name
        self.isUnique = isUnique
        self.quantity = quantity
        self.deckLimit = deckLimit
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
    var hasErrata: Bool
    var url: String
    var imagesrc: String

    init(traits: String? = "", text: String? = "", flavor: String? = "", shadow: String? = "", encounterSet: String? = "", illustrator: String? = "", hasErrata: Bool? = false, url: String? = "", imagesrc: String? = "") {
        self.traits = traits ?? ""
        self.text = text ?? ""
        self.flavor = flavor ?? ""
        self.shadow = shadow ?? ""
        self.encounterSet = encounterSet ?? ""
        self.illustrator = illustrator ?? ""
        self.hasErrata = hasErrata ?? false
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
                (filterPack.isEmpty || filterPack.contains(card.packCode))
                &&
                (filterType == "all types" || card.typeName == filterType)
                &&
                (filterSphere == "all spheres" || card.sphereCode == filterSphere)
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
