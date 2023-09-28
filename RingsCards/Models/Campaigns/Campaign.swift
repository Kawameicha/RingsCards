//
//  Campaign.swift
//  RingsCards
//
//  Created by Christoph Freier on 04.09.23.
//

import Foundation

struct Campaign: Hashable, Identifiable {
    var id: UUID
    var created = Date.now.formatted(date: .abbreviated, time: .shortened)
    var name: String
    let code: CampaignCode
    let scenarios: [Int]
    var completed: [Bool]
    var decks: Int?
    var fallenHeros: String
    var threatPenalty: Int
    var notes: String
    var boons: String
    var burdens: String

    enum CampaignCode: String, CaseIterable {
        case core, mirkwood
    }

    static let `default` = Campaign(name: "Default Core Set Campaign",
                                    code: .core,
                                    scenarios: Array(1...3),
                                    completed: Array(repeating: false, count:3))
}

extension Campaign {
    init(name: String, code: CampaignCode, scenarios: [Int], completed: [Bool]) {
        self.id = UUID()
        self.name = name
        self.code = code
        self.scenarios = scenarios
        self.completed = completed
        self.fallenHeros = ""
        self.threatPenalty = 0
        self.notes = ""
        self.boons = ""
        self.burdens = ""
    }
}
