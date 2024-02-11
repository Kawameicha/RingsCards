//
//  RuleList.swift
//  RingsCards
//
//  Created by Christoph Freier on 11.02.24.
//

import SwiftUI
import SwiftData

struct RuleList: View {
    @Environment(ViewRuleModel.self) var viewRuleModel
    @Environment(\.modelContext) var modelContext
    @Query var rules: [Rule]

    init(
        filterRule: [String] = [],
        searchText: String = ""
    ) {
        let predicate = Rule.predicate(
            searchText: searchText,
            filterRule: filterRule
        )
        _rules = Query(filter: predicate, sort: \.name)
    }

    var body: some View {
        @Bindable var viewRuleModel = viewRuleModel

        List {
            ForEach(rules) { rule in
                NavigationLink {
                    RuleView(rule: rule)
                } label: {
                    Text("\(rule.name)")
                }
            }
        }
        .navigationTitle("Glossary")
        .searchable(text: $viewRuleModel.searchText)
    }
}

#Preview {
    RuleList()
        .modelContainer(previewModelContainer)
        .environment(ViewRuleModel())
}
