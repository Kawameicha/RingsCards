//
//  EncounterList.swift
//  RingsCards
//
//  Created by Christoph Freier on 30.10.23.
//

import SwiftUI

struct EncounterList: View {
    var scenario: Scenario

    var body: some View {
        LazyVStack(alignment: .leading) {
            ForEach(scenario.encounters) { encounter in
                HStack {
                    CircleIcon(image: Image(encounter.code))

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

struct EncounterList_Previews: PreviewProvider {
    static var scenarios = RingsData().scenarios

    static var previews: some View {
        EncounterList(scenario: scenarios[0])
    }
}
