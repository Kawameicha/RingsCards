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
    @State var viewCardModel = ViewCardModel()
    @State var viewDeckModel = ViewDeckModel()
    @State var viewCampaignModel = ViewCampaignModel()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(viewCardModel)
                .environment(viewDeckModel)
                .environment(viewCampaignModel)
        }
        .modelContainer(ringsUserData)
    }
}
