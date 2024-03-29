//
//  KeywordList.swift
//  RingsCards
//
//  Created by Christoph Freier on 09.01.24.
//

import SwiftUI
import SwiftData

struct KeywordList: View {
    @Environment(ViewRuleModel.self) var viewRuleModel
    @Environment(\.modelContext) var modelContext
    @Query var keywords: [Rule]

    init(
        searchText: String = ""
    ) {
        _keywords = Query(filter: #Predicate<Rule> { rule in
            rule.isKeyword && (searchText.isEmpty || rule.name.localizedStandardContains(searchText))}, sort: \Rule.id)
    }

    var body: some View {
        @Bindable var viewRuleModel = viewRuleModel

        List {
            ForEach(keywords) { rule in
                NavigationLink(value: Router.ruleView(rule)) {
                    Text("\(rule.name)")
                }
            }
        }
        .navigationTitle("Keywords")
        .searchable(text: $viewRuleModel.searchText, placement: .navigationBarDrawer(displayMode: .always))
        .disableAutocorrection(true)
    }
}

#Preview {
    KeywordList()
        .modelContainer(ringsUserData)
        .environment(ViewRuleModel())
}
