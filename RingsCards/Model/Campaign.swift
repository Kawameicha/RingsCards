//
//  Campaign.swift
//  RingsCards
//
//  Created by Christoph Freier on 04.09.23.
//

import Foundation

struct Campaign {
    var name: String
    let code: CampaignCode
    let scenarioId: [Int]
    var scenarioCompleted: [Bool]
    var decks: Int?
    var fallenHeros: String
    var threatPenalty: Int
    var notes: String
    var boons: String
    var burdens: String
    let created = Date()
    
    enum CampaignCode: String, CaseIterable {
        case core, other
    }

    static let `default` = Campaign(name: "My Core Campaign", code: CampaignCode.core,
                                    scenarioId: [1,2,3], scenarioCompleted: [true,false,false],
                                    fallenHeros: "None yet", threatPenalty: 0,
                                    notes: "", boons: "", burdens: "")
}
