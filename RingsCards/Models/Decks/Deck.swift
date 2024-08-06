//
//  Deck.swift
//  RingsCards
//
//  Created by Christoph Freier on 25.09.23.
//

import Foundation
import SwiftData

@Model
final class Deck: Identifiable {
    @Attribute(.unique) let uuid = UUID()
    var code: Int
    var name: String
    let created: Date
    var updated: Date
    var version: String
    var deckNote: String
    var deckTags: [String]
    var threat: Int
    var heroes: [String:Int]
    var cardSlots: [String:Int]
    var sideSlots: [String:Int]
    var campaigns: [Campaign]?

    init(code: Int? = 0, name: String, created: Date = .now, updated: Date = .now, version: String? = "1.0", deckNote: String? = "", deckTags: [String]? = [], threat: Int? = 0, heroes: [String : Int]? = [:], cardSlots: [String : Int]? = [:], sideSlots: [String : Int]? = [:], campaigns: [Campaign]? = []) {
        self.code = code ?? 0
        self.name = name
        self.created = created
        self.updated = updated
        self.version = version ?? "1.0"
        self.deckNote = deckNote ?? ""
        self.deckTags = deckTags ?? []
        self.threat = threat ?? 0
        self.heroes = heroes ?? [:]
        self.cardSlots = cardSlots ?? [:]
        self.sideSlots = sideSlots ?? [:]
        self.campaigns = campaigns
    }
}

extension Deck {
    static var emptyDeck: Deck {
        Deck(code: -1, name: "")
    }
}

extension Deck {
    static func predicate(
        searchText: String
    ) -> Predicate<Deck> {

        return #Predicate<Deck> { deck in
            (searchText.isEmpty || deck.name.localizedStandardContains(searchText))
        }
    }
}
