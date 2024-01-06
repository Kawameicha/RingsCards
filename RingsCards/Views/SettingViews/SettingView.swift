//
//  SettingView.swift
//  RingsCards
//
//  Created by Christoph Freier on 29.08.23.
//

import SwiftUI

struct SettingView: View {
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
            }
            .navigationTitle("Settings")
        }
    }
}

#Preview {
    SettingView()
        .modelContainer(previewModelContainer)
}
