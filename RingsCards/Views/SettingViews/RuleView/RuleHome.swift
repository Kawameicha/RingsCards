//
//  RuleHome.swift
//  RingsCards
//
//  Created by Christoph Freier on 29.02.24.
//

import SwiftUI

struct RuleHome: View {
    @Environment(ViewRuleModel.self) var viewRuleModel
    @Environment(\.modelContext) var modelContext

    var body: some View {
        @Bindable var viewRuleModel = viewRuleModel

        RuleList(searchText: viewRuleModel.searchText)
            .navigationTitle("Glossary")
            .searchable(text: $viewRuleModel.searchText)
            .disableAutocorrection(true)
    }
}

#Preview {
    RuleHome()
        .modelContainer(previewModelContainer)
        .environment(ViewRuleModel())
}
