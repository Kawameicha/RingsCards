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
    var campaignMode: Bool
    var slots: [String:Int]

    init(name: String, code: String, creation: Date = .now, scenarios: [Int], completed: [Bool], campaignMode: Bool, slots: [String:Int]) {
        self.name = name
        self.code = code
        self.creation = creation
        self.update = creation
        self.scenarios = scenarios
        self.completed = completed
        self.fallenHeros = ""
        self.threatPenalty = 0
        self.notes = ""
        self.campaignMode = campaignMode
        self.slots = slots
    }
}

enum CampaignCode: String, CaseIterable {
    case core, mirkwood, dwarrowdelf, shadow, ring, angmar, dream, haradrim, mithrin, mordor, rohirrim, hobbit, lotr
}
