//
//  ScenarioKeywordList.swift
//  RingsCards
//
//  Created by Christoph Freier on 29.10.23.
//

import SwiftUI
import SwiftData

struct ScenarioKeywordList: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var keywords: [Keyword]
    var scenario: Scenario

    init(
        scenario: Scenario,

        filterScenario: [String] = []
    ) {
        self.scenario = scenario

        let predicate = Keyword.predicate(
            filterScenario: scenario.keywords.map { $0.name }
        )
        _keywords = Query(filter: predicate, sort: \.name)
    }

    var body: some View {
        LazyVStack(alignment: .leading) {
            ForEach(keywords) { keyword in
                NavigationLink {
                    KeywordView(keyword: keyword)
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
        ScenarioKeywordList(scenario: scenario, filterScenario: [])
    }
    .modelContainer(previewModelContainer)
}
