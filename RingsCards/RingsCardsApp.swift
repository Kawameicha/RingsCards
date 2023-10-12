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
    @State private var viewModel = ViewModel()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(ringsData)
                .environment(viewModel)
        }
        .modelContainer(ringsUserData)
    }
}
