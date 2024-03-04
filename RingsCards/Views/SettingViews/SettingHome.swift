//
//  SettingHome.swift
//  RingsCards
//
//  Created by Christoph Freier on 29.08.23.
//

import SwiftUI

struct SettingHome: View {
    @Environment(\.modelContext) var modelContext

    var body: some View {
        List {
            Section(header: Text("Cards")) {
                NavigationLink(value: Router.packList) {
                    Label("Edit Collection", systemImage: "plus.rectangle.portrait")
                }
            }

            Section(header: Text("Rules")) {
                NavigationLink(value: Router.ruleList) {
                    Label("Glossary", systemImage: "square.fill.text.grid.1x2")
                }

                NavigationLink(value: Router.keywordList) {
                    Label("Keywords", systemImage: "text.redaction")
                }
            }

            Section(header: Text("Support")) {
                NavigationLink(value: Router.supportHome) {
                    Label("About Rings Cards", systemImage: "info.square")
                }
            }
        }
        .navigationTitle("Settings")
    }
}

#Preview {
    SettingHome()
}
