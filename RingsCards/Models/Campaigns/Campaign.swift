//
//  Campaign.swift
//  RingsCards
//
//  Created by Christoph Freier on 04.09.23.
//

import Foundation
import SwiftData

@Model
class Campaign {
    var name: String
    let code: String
    let creation: Date
    var update: Date
    let scenarios: [Int]
    var completed: [Bool]
    var fallenHeroes: [String:Int]
    var threatPenalty: Int
    var notes: String
    var campaignMode: Bool
    var slots: [String:Int]
    var decks: [Deck]?

    init(name: String, code: String, creation: Date = .now, scenarios: [Int], completed: [Bool], fallenHeroes: [String:Int]? = [:], campaignMode: Bool, slots: [String:Int], decks: [Deck]? = []) {
        self.name = name
        self.code = code
        self.creation = creation
        self.update = creation
        self.scenarios = scenarios
        self.completed = completed
        self.fallenHeroes = fallenHeroes ?? [:]
        self.threatPenalty = 0
        self.notes = ""
        self.campaignMode = campaignMode
        self.slots = slots
        self.decks = decks
    }
}

extension Campaign {
    static var emptyCampaign: Campaign {
        Campaign(name: "", code: "", scenarios: [], completed: [], campaignMode: false, slots: [:])
    }
}

enum CampaignCode: String, CaseIterable {
    case core, mirkwood, dwarrowdelf, shadow, ring, angmar, dream, haradrim, mithrin, mordor, rohirrim, hobbit, lotr
}
