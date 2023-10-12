//
//  RingsUserData.swift
//  RingsCards
//
//  Created by Christoph Freier on 26.09.23.
//

import SwiftData

@MainActor
let ringsUserData: ModelContainer = {
    do {
        let container = try ModelContainer(
            for: Card.self, Deck.self, Campaign.self, Collection.self,
            configurations: ModelConfiguration(isStoredInMemoryOnly: false)
        )

        let modelContext = container.mainContext

        if try modelContext.fetch(FetchDescriptor<Collection>()).isEmpty {
            UserCollection.contents.forEach { container.mainContext.insert($0) }
        }

        return container
    } catch {
        fatalError("Failed to create container")
    }
}()
