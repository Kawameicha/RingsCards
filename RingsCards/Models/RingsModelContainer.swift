//
//  RingsModelContainer.swift
//  RingsCards
//
//  Created by Christoph Freier on 26.09.23.
//

import SwiftData

@MainActor
let ringsModelContainer: ModelContainer = {
    do {
        let container = try ModelContainer(
            for: Card.self, Deck.self, Campaign.self,
            configurations: ModelConfiguration(isStoredInMemoryOnly: false)
        )

        let modelContext = container.mainContext

        return container
    } catch {
        fatalError("Failed to create container")
    }
}()
