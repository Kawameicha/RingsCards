//
//  ScenarioRow.swift
//  RingsCards
//
//  Created by Christoph Freier on 28.08.23.
//

import SwiftUI

struct ScenarioRow: View {
    var scenario: Scenario

    var body: some View {
        VStack(alignment: .leading, spacing: 3) {
            Text(scenario.name)
                .font(.headline)
            HStack(spacing: 3) {
                Label(scenario.pack, systemImage: "book")
            }
            .foregroundColor(.secondary)
            .font(.subheadline)
        }
    }
}

struct ScenarioRow_Previews: PreviewProvider {
    static var scenarios = RingsData().scenarios

    static var previews: some View {
        Group {
            ScenarioRow(scenario: scenarios[0])
        }
    }
}
