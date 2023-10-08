//
//  SettingView.swift
//  RingsCards
//
//  Created by Christoph Freier on 29.08.23.
//

import SwiftUI

struct SettingView: View {
    @EnvironmentObject var ringsData: RingsData
    @State private var showingProfile = false

    var body: some View {
        NavigationView {
            List {
                Section(header: Text("Cards")) {
                    NavigationLink {
                        CollectionList()
                    } label: {
                        Text("Edit Collection")
                    }
                }
            }
            .navigationTitle("Settings")
            .toolbar {
                Button {
                    showingProfile.toggle()
                } label: {
                    Label("User Profile", systemImage: "person.crop.circle")
                }
            }
            .sheet(isPresented: $showingProfile) {
                UserHost()
                    .environmentObject(ringsData)
                    .presentationDetents([.medium, .large])
            }
        }
    }
}

#Preview {
    SettingView()
        .environmentObject(RingsData())
        .modelContainer(previewModelContainer)
}
