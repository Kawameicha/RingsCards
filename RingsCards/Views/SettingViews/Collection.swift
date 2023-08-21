//
//  Collection.swift
//  RingsCards
//
//  Created by Christoph Freier on 21.08.23.
//

import SwiftUI

struct Collection: View {
    @EnvironmentObject var ringsData: RingsData
    @State private var coreSet = true
    @State private var moreSet = false

    var body: some View {
        NavigationView {
            List {
                Toggle(isOn: $coreSet) {
                    Text("Core set")
                }
                Toggle(isOn: $moreSet) {
                    Text("More set")
                }
            }
            .navigationTitle("My Collection")
        }
    }
}

struct Collection_Previews: PreviewProvider {
    static var previews: some View {
        Collection()
            .environmentObject(RingsData())
    }
}
