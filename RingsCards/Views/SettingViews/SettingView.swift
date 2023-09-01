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
                        CollectionView()
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

struct SettingView_Previews: PreviewProvider {
    static var previews: some View {
        SettingView()
            .environmentObject(RingsData())
    }
}
