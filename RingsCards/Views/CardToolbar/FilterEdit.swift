//
//  FilterEdit.swift
//  RingsCards
//
//  Created by Christoph Freier on 26.08.23.
//

import SwiftUI

enum Sphere: String, CaseIterable, Identifiable {
    case leadership, tatics, spirit, lore, neutral
    var id: Self { self }
}

struct FilterEdit: View {
    @State private var selectedSphere: Sphere = .leadership

    var body: some View {
        NavigationView {
            Picker("Sphere", selection: $selectedSphere) {
                ForEach(Sphere.allCases) { sphere in
                    Text(sphere.rawValue.capitalized)
                }
            }
            .pickerStyle(.menu)
        }
    }
}

struct FilterEdit_Previews: PreviewProvider {
    static var previews: some View {
        FilterEdit()
    }
}
