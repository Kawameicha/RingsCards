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
    @State var viewRuleModel = ViewRuleModel()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(viewCardModel)
                .environment(viewDeckModel)
                .environment(viewCampaignModel)
                .environment(ViewRuleModel())
        }
        .modelContainer(ringsUserData)
    }
}
