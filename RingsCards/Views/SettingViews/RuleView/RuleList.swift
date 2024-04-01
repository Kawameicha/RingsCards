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
    var keywordOnly: Bool = false

    var body: some View {
        @Bindable var viewRuleModel = viewRuleModel

        switch keywordOnly {
        case true:
            KeywordsView(
                keywordOnly: true,
                searchText: viewRuleModel.searchText
            )
            .navigationTitle("Keywords")
            .searchable(text: $viewRuleModel.searchText)
            .disableAutocorrection(true)
        case false:
            KeywordsView(
                keywordOnly: false,
                searchText: viewRuleModel.searchText
            )
            .navigationTitle("Glossary")
            .searchable(text: $viewRuleModel.searchText)
            .disableAutocorrection(true)
        }
    }
}

private struct KeywordsView: View {
    @Environment(ViewRuleModel.self) var viewRuleModel
    @Environment(\.modelContext) var modelContext
    @Query var rules: [Rule]
    @State private var toolbarVisibility : Visibility = .hidden

    init(
        keywordOnly: Bool = false,
        filterRule: [String] = [],
        searchText: String = ""
    ) {
        let predicate = Rule.predicate(
            keywordOnly: keywordOnly,
            searchText: searchText,
            filterRule: filterRule
        )

        switch keywordOnly {
        case true : _rules = Query(filter: predicate, sort: \Rule.id)
        case false: _rules = Query(filter: predicate, sort: \Rule.id)
        }
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
        // navigationBarDrawer Fix
        .onAppear {toolbarVisibility = .automatic}
        .toolbar(toolbarVisibility, for: .navigationBar)
    }
}

private struct GlossaryView: View {
    @Environment(ViewRuleModel.self) var viewRuleModel
    @Environment(\.modelContext) var modelContext
    @Query var rules: [Rule]
    @State private var toolbarVisibility : Visibility = .hidden

    init(
        keywordOnly: Bool = false,
        filterRule: [String] = [],
        searchText: String = ""
    ) {
        let predicate = Rule.predicate(
            keywordOnly: keywordOnly,
            searchText: searchText,
            filterRule: filterRule
        )

        switch keywordOnly {
        case true : _rules = Query(filter: predicate, sort: \Rule.id)
        case false: _rules = Query(filter: predicate, sort: \Rule.id)
        }
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
        // navigationBarDrawer Fix
        .onAppear {toolbarVisibility = .automatic}
        .toolbar(toolbarVisibility, for: .navigationBar)
    }
}

#Preview {
    RuleList()
        .modelContainer(ringsUserData)
        .environment(ViewRuleModel())
}
