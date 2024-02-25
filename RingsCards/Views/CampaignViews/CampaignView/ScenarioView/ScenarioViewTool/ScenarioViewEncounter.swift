//
//  ScenarioViewEncounter.swift
//  RingsCards
//
//  Created by Christoph Freier on 30.10.23.
//

import SwiftUI

struct ScenarioViewEncounter: View {
    var scenario: Scenario

    var body: some View {
        LazyVStack(alignment: .leading) {
            ForEach(scenario.encounterSets, id: \.self) { encounter in
                HStack {
                    ScenarioViewIcon(image: Image(encounter.code))

                    VStack(alignment: .leading) {
                        Text(encounter.name)
                            .foregroundColor(.primary)
                            .font(.headline)

                        Text("From the \(scenario.pack)")
                            .foregroundColor(.secondary)
                            .font(.subheadline)
                    }
                }
            }
        }
        .padding()
    }
}

#Preview {
    ModelPreview { scenario in
        ScenarioViewEncounter(scenario: scenario)
    }
    .modelContainer(previewModelContainer)
}
