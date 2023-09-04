//
//  ScenarioList.swift
//  RingsCards
//
//  Created by Christoph Freier on 28.08.23.
//

import SwiftUI

struct ScenarioList: View {
    @EnvironmentObject var ringsData: RingsData
    @State private var searchText: String = ""
    @State private var showingNotes = false

    var filteredScenarios: [Scenario] {
        guard !searchText.isEmpty else { return ringsData.scenarios }
        return ringsData.scenarios.filter { scenario in
            scenario.name.lowercased().cleaned().contains(searchText.lowercased())
        }
    }

    var body: some View {
        NavigationView {
            List(ringsData.scenarios) { scenario in
                NavigationLink {
                    ScenarioView(scenario: scenario)
                } label: {
                    ScenarioRow(scenario: scenario)
                }
            }
            .listStyle(.sidebar)
            .navigationTitle("My Core Campaign")
            .searchable(text: $searchText)
            .toolbar {
                Button {
                    showingNotes.toggle()
                } label: {
                    Label("Campaign Notes", systemImage: "ellipsis.circle")
                }
            }
            .sheet(isPresented: $showingNotes) {
                CampaignHost()
                    .environmentObject(ringsData)
                    .presentationDetents([.medium, .large])
            }
        }
    }
}

struct ScenarioList_Previews: PreviewProvider {
    static var previews: some View {
        ScenarioList()
            .environmentObject(RingsData())
    }
}
