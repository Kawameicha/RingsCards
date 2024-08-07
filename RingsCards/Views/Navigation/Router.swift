//
//  Router.swift
//  RingsCards
//
//  Created by Willy Breitenbach on 15.02.24.
//

import SwiftUI

enum Router: Hashable {
    case cardList(filterPack: [String], filterDeck: [String])
    case cardView(Card)

    case deckList(campaign: Campaign, editDeck: Bool)
    case deckNew
    case deckViewHome(deck: Deck)

    case campaignViewHome(campaign: Campaign, decks: [Deck])
    case campaignNew
    case scenarioViewHome(campaign: Campaign, scenario: Scenario)

    case packList
    case ruleList(keywordOnly: Bool)
    case ruleView(Rule)
    case supportHome
}

extension View {
    @ViewBuilder
    func withRouter() -> some View {
        navigationDestination(for: Router.self) { route in
            switch route {
            case .cardList(filterPack: let filterPack, filterDeck: let filterDeck):
                CardList(filterPack: filterPack, filterDeck: filterDeck)
            case .cardView(let card):
                CardView(card: card)

            case .deckList(campaign: let campaign, editDeck: let editDeck):
                DeckList(campaign: campaign, editDeck: editDeck)
            case .deckViewHome(deck: let deck):
                DeckViewHome(deck: deck)
            case .deckNew:
                DeckNew()

            case .campaignViewHome(campaign: let campaign, decks: let decks):
                CampaignViewHome(campaign: campaign, decks: decks)
            case .campaignNew:
                CampaignNew()
            case .scenarioViewHome(campaign: let campaign, scenario: let scenario):
                ScenarioViewHome(campaign: campaign, scenario: scenario)

            case .packList:
                PackList()
            case .ruleList(keywordOnly: let keywordOnly):
                RuleList(keywordOnly: keywordOnly)
            case .ruleView(let rule):
                RuleView(rule: rule)
            case .supportHome:
                SupportHome()
            }
        }
    }
}
