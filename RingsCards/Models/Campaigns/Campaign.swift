//
//  Campaign.swift
//  RingsCards
//
//  Created by Christoph Freier on 04.09.23.
//

import Foundation
import SwiftData

@Model
class Campaign: Identifiable {
    @Attribute(.unique) let uuid = UUID()
    let code: String
    var name: String
    let created: Date
    var updated: Date
    let scenarios: [Int]
    var completed: [Bool]
    var campaignMode: Bool
    var campaignNote: String
    var fallenHeroes: [String:Int]
    var threatModifs: Int
    var slots: [String:Int]
    var decks: [Deck]

    init(code: String, name: String, created: Date = .now, updated: Date = .now, scenarios: [Int], completed: [Bool], campaignMode: Bool, campaignNote: String? = "", fallenHeroes: [String : Int]? = [:], threatModifs: Int? = 0, slots: [String : Int]? = [:], decks: [Deck]? = []) {
        self.code = code
        self.name = name
        self.created = created
        self.updated = updated
        self.scenarios = scenarios
        self.completed = completed
        self.campaignMode = campaignMode
        self.campaignNote = campaignNote ?? ""
        self.fallenHeroes = fallenHeroes ?? [:]
        self.threatModifs = threatModifs ?? 0
        self.slots = slots ?? [:]
        self.decks = decks ?? []
    }
}

extension Campaign {
    static var emptyCampaign: Campaign {
        Campaign(code: "", name: "", scenarios: [], completed: [], campaignMode: false)
    }
}

enum CampaignCode: String, CaseIterable {
    case Core, SoM, D, AtS, TRM, AA, DC, H, EM, VoM, OotR, OHaUH, TBR
    var id: Self { self }
}

extension Campaign {
    static func predicate(
        searchText: String
    ) -> Predicate<Campaign> {

        return #Predicate<Campaign> { campaign in
            (searchText.isEmpty || campaign.name.localizedStandardContains(searchText))
        }
    }
}
