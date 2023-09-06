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

    static let `default` = Campaign(id: UUID(),
                                    name: "My Core Set Campaign",
                                    code: CampaignCode.core,
                                    scenarios: [1,2,3],
                                    completed: [false,false,false],
                                    fallenHeros: "",
                                    threatPenalty: 0,
                                    notes: "",
                                    boons: "",
                                    burdens: "")
}
