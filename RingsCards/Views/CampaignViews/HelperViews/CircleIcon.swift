//
//  CircleIcon.swift
//  RingsCards
//
//  Created by Christoph Freier on 20.08.23.
//

import SwiftUI

struct CircleIcon: View {
    var image: Image

    var body: some View {
        image
            .resizable()
            .frame(width: 40, height: 40)
            .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
            .overlay { Circle().stroke(.white, lineWidth: 3) }
            .shadow(radius: 6)
    }
}

#Preview {
    CircleIcon(image: Image("passage-through-mirkwood"))
}

