//
//  CollectionButton.swift
//  RingsCards
//
//  Created by Christoph Freier on 21.08.23.
//

import SwiftUI

struct CollectionButton: View {
    @Binding var isSet: Bool

    var body: some View {
        Button {
            isSet.toggle()
        } label: {
            Label("Toggle Favorite", systemImage: isSet ? "checkmark.square.fill" : "checkmark.square")
                .labelStyle(.iconOnly)
                .foregroundColor(isSet ? .yellow : .gray)
        }
    }
}

struct CollectionButton_Previews: PreviewProvider {
    static var previews: some View {
        CollectionButton(isSet: .constant(true))
    }
}
