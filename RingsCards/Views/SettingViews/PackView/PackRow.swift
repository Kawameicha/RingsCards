//
//  PackRow.swift
//  RingsCards
//
//  Created by Christoph Freier on 08.10.23.
//

import SwiftUI

struct PackRow: View {
    @Bindable var packs: Pack

    var body: some View {
        HStack {
            PackIcon(image: Image(packs.cycleCode))

            Toggle("\(packs.packName)", isOn: $packs.isInCollection)
                .toggleStyle(CheckboxStyle())
        }
    }
}

#Preview {
    ModelPreview { pack in
        PackRow(packs: pack)
    }
    .modelContainer(previewModelContainer)
}
