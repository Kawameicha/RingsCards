//
//  ScenarioView.swift
//  RingsCards
//
//  Created by Christoph Freier on 29.08.23.
//

import SwiftUI

struct ScenarioView: View {
    var scenario: Scenario

    var body: some View {
        ScrollView {
            CircleImage(image: Image(scenario.nameCanonical))

            VStack(alignment: .leading) {
                Text(scenario.name)
                    .font(.title)

                HStack {
                    Text(scenario.pack)
                    Spacer()
                    Text(scenario.id.description)
                }
                .font(.subheadline)
                .foregroundColor(.secondary)

                Divider()

                ScenarioChart(scenario: scenario)

                ForEach(scenario.encounters) { name in
                    Text(name.name)
                }
            }
            .padding()
        }
    }
}

struct ScenarioView_Previews: PreviewProvider {
    static var scenarios = RingsData().scenarios

    static var previews: some View {
            ScenarioView(scenario: scenarios[0])
    }
}
