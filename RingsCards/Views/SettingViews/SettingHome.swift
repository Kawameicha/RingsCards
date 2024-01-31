//
//  SettingHome.swift
//  RingsCards
//
//  Created by Christoph Freier on 29.08.23.
//

import SwiftUI

struct SettingHome: View {
    var body: some View {
        NavigationStack {
            List {
                Section(header: Text("Cards")) {
                    NavigationLink("Edit Collection") {
                        PackList()
                    }
                }

                Section(header: Text("Rules")) {
                    NavigationLink("All Keywords") {
                        KeywordList()
                    }
                }

                Section(header: Text("Support")) {
                    NavigationLink("About Rings Cards") {
                        SupportHome()
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
}
