//
//  CollectionRow.swift
//  RingsCards
//
//  Created by Christoph Freier on 08.10.23.
//

import SwiftUI

struct CollectionRow: View {
    @Bindable var collection: Collection

    var body: some View {
        Toggle("\(collection.self.packName)", systemImage: "\(collection.self.packPosition).square", isOn: $collection.self.isInCollection)
    }
}

#Preview {
    ModelPreview { collection in
        CollectionRow(collection: collection)
    }
    .modelContainer(previewModelContainer)
}
