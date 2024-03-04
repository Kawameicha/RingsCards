//
//  ScenarioViewIcon.swift
//  RingsCards
//
//  Created by Christoph Freier on 20.08.23.
//

import SwiftUI

struct ScenarioViewIcon: View {
    var image: Image
    var frame = 40.0

    var body: some View {
        image
            .resizable()
            .frame(width: frame, height: frame)
            .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
            .overlay { Circle().stroke(.white, lineWidth: 3) }
            .shadow(radius: 6)
    }
}

#Preview {
    ScenarioViewIcon(image: Image("passage-through-mirkwood"))
}

