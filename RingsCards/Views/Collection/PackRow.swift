//
//  PackRow.swift
//  RingsCards
//
//  Created by Christoph Freier on 22.08.23.
//

import SwiftUI

struct PackRow: View {
    var pack: Pack

    var body: some View {
        HStack {
            Text(pack.name)
                .foregroundColor(.primary)
                .font(.headline)
            CollectionButton(isSet: .constant(true))
            if pack.inCollection {
                Image(systemName: "star.fill")
            }
        }
    }
}

struct PackRow_Previews: PreviewProvider {
    static var packs = RingsData().packs

    static var previews: some View {
        Group {
            PackRow(pack: packs[0])
        }
    }
}
