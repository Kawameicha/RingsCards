//
//  RingsCardsApp.swift
//  RingsCards
//
//  Created by Christoph Freier on 19.08.23.
//

import SwiftUI

@main
struct RingsCardsApp: App {
    @StateObject private var ringsData = RingsData()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(ringsData)
        }
    }
}
