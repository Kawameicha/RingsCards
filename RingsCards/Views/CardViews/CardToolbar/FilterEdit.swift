//
//  FilterEdit.swift
//  RingsCards
//
//  Created by Christoph Freier on 26.08.23.
//

import SwiftUI

struct FilterEdit: View {
    @EnvironmentObject var ringsData: RingsData

    var body: some View {
        NavigationView {
            List {
                Section(header: Text("Sphere")) {
                    ForEach($ringsData.spheres) { $sphere in
                        Toggle(sphere.name, isOn: $sphere.filterIn)
                    }
                }
            }
            .listStyle(.sidebar)
            .navigationTitle("Edit Filters")
        }
    }
}

struct FilterEdit_Previews: PreviewProvider {
    static var previews: some View {
        FilterEdit()
            .environmentObject(RingsData())
    }
}
