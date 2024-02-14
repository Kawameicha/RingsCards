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

    private var filterRule: [String]
    
    init(
        filterRule: [String] = []
    ) {
        self.filterRule = filterRule
    }

    var body: some View {
        @Bindable var viewRuleModel = viewRuleModel
        
        RuleListView(filterRule: filterRule, searchText: viewRuleModel.searchText)
            .navigationTitle("Glossary")
            .searchable(text: $viewRuleModel.searchText)
    }
}

private struct RuleListView: View {
    @Query var rules: [Rule]
    
    init(
        filterRule: [String] = [],
        searchText: String
    ) {
    }
    
    var body: some View {
        _rules = Query(filter: #Predicate<Rule> { rule in
            !rule.isKeyword && (searchText.isEmpty || rule.name.localizedStandardContains(searchText))}, sort: \Rule.id)
        List {
            ForEach(rules) { rule in
                NavigationLink(value: Router.ruleView(rule)) {
                    Text("\(rule.name)")
                }
            }
        }
    }
}

#Preview {
    RuleList()
        .modelContainer(previewModelContainer)
        .environment(ViewRuleModel())
}
