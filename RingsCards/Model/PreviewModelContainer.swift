//
//  PreviewModelContainer.swift
//  RingsCards
//
//  Created by Christoph Freier on 26.09.23.
//

import SwiftData

@MainActor
let previewModelContainer: ModelContainer = {
    do {
        let container = try ModelContainer(
            for: Deck.self,
            configurations: ModelConfiguration(isStoredInMemoryOnly: true)
        )
        let modelContext = container.mainContext

        if try modelContext.fetch(FetchDescriptor<Deck>()).isEmpty {
            SampleDeck.contents.forEach { container.mainContext.insert($0) }
        }

        return container
    } catch {
        fatalError("Failed to create container")
    }
}()
