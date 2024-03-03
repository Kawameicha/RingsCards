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
        searchText: String = ""
    ) {
        _rules = Query(filter: #Predicate<Rule> { rule in
            !rule.isKeyword && (searchText.isEmpty || rule.name.localizedStandardContains(searchText))}, sort: \Rule.id)
    }

    var body: some View {
        @Bindable var viewRuleModel = viewRuleModel

        List {
            ForEach(rules) { rule in
                NavigationLink(value: Router.ruleView(rule)) {
                    Text("\(rule.name)")
                }
            }
        }
        .navigationTitle("Glossary")
        .searchable(text: $viewRuleModel.searchText, placement: .navigationBarDrawer(displayMode: .always))
        .disableAutocorrection(true)
    }
}

#Preview {
    RuleList()
        .modelContainer(previewModelContainer)
        .environment(ViewRuleModel())
}
