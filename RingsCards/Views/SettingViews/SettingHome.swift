//
//  SettingHome.swift
//  RingsCards
//
//  Created by Christoph Freier on 29.08.23.
//

import SwiftUI

struct SettingHome: View {
    var body: some View {
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
                        KeywordList()
                    } label: {
                        Text("All Keywords")
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
}
