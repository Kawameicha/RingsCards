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
    var fallenHeros: String
    var threatPenalty: Int
    var notes: String
    var boons: String
    var burdens: String

    init(name: String, code: String, creation: Date = .now, update: Date = .now, scenarios: [Int], completed: [Bool]) {
        self.name = name
        self.code = code
        self.creation = creation
        self.update = update
        self.scenarios = scenarios
        self.completed = completed
        self.fallenHeros = ""
        self.threatPenalty = 0
        self.notes = ""
        self.boons = ""
        self.burdens = ""
    }
}

enum CampaignCode: String, CaseIterable {
    case core, mirkwood, dwarrowdelf, shadow, ring, angmar, dream, haradrim, mithrin, mordor, rohirrim, hobbit, lotr
}
