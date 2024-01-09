//
//  PackIcon.swift
//  RingsCards
//
//  Created by Christoph Freier on 25.12.23.
//

import SwiftUI

struct PackIcon: View {
    @Environment(\.colorScheme) var colorScheme
    var image: Image

    var body: some View {
        if colorScheme == .dark {
            image
                .resizable()
                .frame(width: 20, height: 20)
                .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                .colorInvert()
        } else {
            image
                .resizable()
                .frame(width: 20, height: 20)
                .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
        }
    }
}

#Preview {
    PackIcon(image: Image("SoM"))
}
