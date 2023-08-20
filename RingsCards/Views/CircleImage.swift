//
//  CircleImage.swift
//  RingsCards
//
//  Created by Christoph Freier on 20.08.23.
//

import SwiftUI

struct CircleImage: View {
    var image: Image

    var body: some View {
        image
            .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
            .overlay {
                Circle().stroke(.white, lineWidth: 4)
        }
        .shadow(radius: 7)
    }
}
