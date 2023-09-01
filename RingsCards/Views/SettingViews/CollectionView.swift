//
//  CollectionView.swift
//  RingsCards
//
//  Created by Christoph Freier on 01.09.23.
//

import SwiftUI

struct CollectionView: View {
    @EnvironmentObject var ringsData: RingsData

    let allCycles: [String] = ["Shadows of Mirkwood", "Dwarrowdelf"]

    var body: some View {
        NavigationView {
            List {
                Section(header: Text("All Cycles")) {
                    Toggle("Add to Collection", sources: $ringsData.collection, isOn: \.isInCollection)
                }
                
                ForEach(allCycles, id:\.self) { cycle in
                    Section(header: Text("\(cycle)")) {
                        ForEach($ringsData.collection.filter { $pack in
                            pack.cycleName.contains("\(cycle)")
                        }) { $pack in
                            Toggle("\(pack.packName)", isOn: $pack.isInCollection)
                        }
                    }
                }
            }
            .listStyle(.sidebar)
            .navigationTitle("My Collection")
        }
    }
}

struct CollectionView_Previews: PreviewProvider {
    static var previews: some View {
        CollectionView()
            .environmentObject(RingsData())
    }
}
