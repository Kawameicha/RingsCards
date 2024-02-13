//
//  ScenarioKeywordList.swift
//  RingsCards
//
//  Created by Christoph Freier on 29.10.23.
//

import SwiftUI
import SwiftData

struct ScenarioKeywordList: View {
    @Environment(\.modelContext) var modelContext
    @Query var keywords: [Rule]
    var scenario: Scenario

    init(
        scenario: Scenario
    ) {
        self.scenario = scenario

        let predicate = Rule.predicate(
            searchText: "",
            filterRule: scenario.keywords.map { $0.code }
        )
        _keywords = Query(filter: predicate, sort: \.id)
    }

    var body: some View {
        LazyVStack(alignment: .leading) {
            ForEach(keywords) { keyword in
                NavigationLink {
                    RuleView(rule: keyword)
                } label: {
                    Text("∙ \(keyword.name)")
                }
            }
        }
        .padding()
    }
}

#Preview {
    ModelPreview { scenario in
        ScenarioKeywordList(scenario: scenario)
    }
    .modelContainer(previewModelContainer)
}
