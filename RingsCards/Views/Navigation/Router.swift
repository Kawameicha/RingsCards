//
//  Router.swift
//  RingsCards
//
//  Created by Willy Breitenbach on 15.02.24.
//

import SwiftUI

enum Router: Hashable {
    case campaignViewHome(campaign: Campaign, 
                          decks: [Deck])
    case deckList(campaign: Campaign,
                  campaignView: Bool,
                  campaignDeck: Bool)
    case deckViewHome(deck: Deck)
    case deckNew
    case campaignNew
    case scenarioViewHome(campaign: Campaign, 
                          scenario: Scenario)
    case scenarioList(campaign: Campaign, 
                      filterCampaign: [Int])
    case packList
    case ruleList
    case keywordList
    case supportHome
    case cardList(filterPack: [String],
                  filterDeck: [String],
                  sortParameter: SortParameter? = nil)
    case cardView(Card)
    case ruleView(Rule)
}

extension View {
    @ViewBuilder
    func withRouter() -> some View {
        navigationDestination(for: Router.self) { route in
            switch route {
            case .campaignViewHome(campaign: let campaign, decks: let decks):
                CampaignViewHome(campaign: campaign, decks: decks)
            case .deckList(campaign: let campaign, campaignView: let campaignView, campaignDeck: let campaignDeck):
                DeckList(campaign: campaign, campaignView: campaignView, campaignDeck: campaignDeck)
            case .deckViewHome(deck: let deck):
                DeckViewHome(deck: deck)
            case .deckNew:
                DeckNew()
            case .campaignNew:
                CampaignNew()
            case .scenarioViewHome(campaign: let campaign, scenario: let scenario):
                ScenarioViewHome(campaign: campaign, scenario: scenario)
            case .scenarioList(campaign: let campaign, filterCampaign: let filterCampaign):
                ScenarioList(campaign: campaign, filterCampaign: filterCampaign)
            case .packList:
                PackList()
            case .ruleList:
                RuleList()
            case .keywordList:
                KeywordList()
            case .supportHome:
                SupportHome()
            case .cardList(filterPack: let filterPack, filterDeck: let filterDeck, sortParameter: let sortParameter):
                CardList(
                    filterPack: filterPack,
                    filterDeck: filterDeck,
                    sortParameter: sortParameter
                )
            case .cardView(let card):
                CardView(card: card)
            case .ruleView(let rule):
                RuleView(rule: rule)
            }
        }
    }
}
