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
                    Text("Edit Collection")
                }
            }

            Section(header: Text("Rules")) {
                NavigationLink(value: Router.ruleList) {
                    Text("Glossary")
                }

                NavigationLink(value: Router.keywordList) {
                    Text("Keywords")
                }
            }

            Section(header: Text("Support")) {
                NavigationLink(value: Router.supportHome) {
                    Text("About Rings Cards")
                }
            }
        }
        .navigationTitle("Settings")
    }
}

#Preview {
    SettingHome()
}
