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
    @Attribute(.unique) let code: String
    let name: String
    let traits: String
    let threat: Int? = nil
    let cost: String? = nil
    let deck_limit: Int
    let cardCategory: Int
    let cardDetails: CardDetail

    init(pack_code: String, pack_name: String, type_code: String, type_name: String, sphere_code: String, sphere_name: String, code: String, name: String, traits: String? = "", threat: Int? = nil, cost: String? = nil, deck_limit: Int, cardCategory: Int, cardDetails: CardDetail) {
        self.pack_code = pack_code
        self.pack_name = pack_name
        self.type_code = type_code
        self.type_name = type_name
        self.sphere_code = sphere_code
        self.sphere_name = sphere_name
        self.code = code
        self.name = name
        self.traits = traits ?? ""
        self.threat = threat
        self.cost = cost
        self.deck_limit = deck_limit
        self.cardCategory = cardCategory
        self.cardDetails = cardDetails
    }
}

struct CardDetail: Hashable, Codable {
    var position: Int
    var text: String
    var flavor: String
    var is_unique: Bool
    var victory: Int? = nil
    var quest: Int? = nil
    var willpower: Int? = nil
    var attack: Int? = nil
    var defense: Int? = nil
    var health: Int? = nil
    var quantity: Int
    var illustrator: String
    var has_errata: Bool
    var url: String
    var imagesrc: String

    init(position: Int, text: String? = "", flavor: String? = "", is_unique: Bool, victory: Int? = nil, quest: Int? = nil, willpower: Int? = nil, attack: Int? = nil, defense: Int? = nil, health: Int? = nil, quantity: Int, illustrator: String? = "", has_errata: Bool, url: String, imagesrc: String) {
        self.position = position
        self.text = text ?? ""
        self.flavor = flavor ?? ""
        self.is_unique = is_unique
        self.victory = victory
        self.quest = quest
        self.willpower = willpower
        self.attack = attack
        self.defense = defense
        self.health = health
        self.quantity = quantity
        self.illustrator = illustrator ?? ""
        self.has_errata = has_errata
        self.url = url
        self.imagesrc = imagesrc
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
                &&
                (searchText.isEmpty || card.name.localizedStandardContains(searchText))
            }
        }
    }
}
