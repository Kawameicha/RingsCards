//
//  SettingHome.swift
//  RingsCards
//
//  Created by Christoph Freier on 29.08.23.
//

import SwiftUI

struct SettingHome: View {
    @Environment(ViewRuleModel.self) var viewRuleModel
    @Environment(\.modelContext) var modelContext

    var body: some View {
        @Bindable var viewRuleModel = viewRuleModel

        NavigationView {
            List {
                Section(header: Text("Cards")) {
                    NavigationLink {
                        PackList()
                    } label: {
                        Text("Edit Collection")
                    }
                }

                Section(header: Text("Rules")) {
                    NavigationLink {
                        RuleList(searchText: viewRuleModel.searchText)
                    } label: {
                        Text("Glossary")
                    }

                    NavigationLink {
                        KeywordList()
                    } label: {
                        Text("Keywords")
                    }
                }

                Section(header: Text("Support")) {
                    NavigationLink {
                        SupportHome()
                    } label: {
                        Text("About Rings Cards")
                    }
                }
            }
            .navigationTitle("Settings")
        }
    }
}

#Preview {
    SettingHome()
        .modelContainer(previewModelContainer)
        .environment(ViewCardModel())
        .environment(ViewRuleModel())
}
