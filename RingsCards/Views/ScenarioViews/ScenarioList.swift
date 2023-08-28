//
//  ScenarioList.swift
//  RingsCards
//
//  Created by Christoph Freier on 28.08.23.
//

import SwiftUI

struct ScenarioList: View {
    @EnvironmentObject var ringsData: RingsData

    var body: some View {
        NavigationView {
            List(ringsData.scenarios) { scenario in
                NavigationLink {
//                    PackView(pack: scenario)
                } label: {
                    ScenarioRow(scenario: scenario)
                }
            }
            .navigationTitle("My Scenarios")
        }
    }
}

struct ScenarioList_Previews: PreviewProvider {
    static var previews: some View {
        ScenarioList()
            .environmentObject(RingsData())
    }
}
