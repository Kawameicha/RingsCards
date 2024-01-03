//
//  AppScreen.swift
//  RingsCards
//
//  Created by Christoph Freier on 01.01.24.
//

import SwiftUI

enum AppScreen: Codable, Hashable, Identifiable, CaseIterable {
    case cards
    case decks
    case campaigns
    case settings
    
    var id: AppScreen { self }
}

extension AppScreen {
    @ViewBuilder
    var label: some View {
        switch self {
        case .cards:
            Label("Cards", systemImage: "rectangle.portrait.fill")
        case .decks:
            Label("Decks", systemImage: "person.3.fill")
        case .campaigns:
            Label("Campaigns", systemImage: "book.fill")
        case .settings:
            Label("Settings", systemImage: "slider.horizontal.3")
        }
    }

    @ViewBuilder
    var destination: some View {
        switch self {
        case .cards:
            CardHome()
        case .decks:
            DeckHome()
        case .campaigns:
            CampaignList()
        case .settings:
            SettingView()
        }
    }
}
