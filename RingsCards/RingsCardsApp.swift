//
//  RingsCardsApp.swift
//  RingsCards
//
//  Created by Christoph Freier on 19.08.23.
//

import SwiftUI
import SwiftData

@main
struct RingsCardsApp: App {
    @StateObject private var ringsData = RingsData()
    @State private var viewCardModel = ViewCardModel()
    @State private var viewDeckModel = ViewDeckModel()
    @State private var viewCampaignModel = ViewCampaignModel()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(ringsData)
                .environment(viewCardModel)
                .environment(viewDeckModel)
                .environment(viewCampaignModel)
        }
        .modelContainer(ringsUserData)
    }
}
