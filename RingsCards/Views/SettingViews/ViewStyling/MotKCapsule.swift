//
//  MotKCapsule.swift
//  RingsCards
//
//  Created by Christoph Freier on 14.09.24.
//

import SwiftUI

struct MotKCapsule: View {
    var body: some View {
        ZStack {
            Capsule()
                .stroke(style: StrokeStyle(lineWidth: 2.0))
                .frame(width: 40, height: 20)

            Text("MotK")
                .font(.system(size: 12, weight: .bold))
        }
    }
}

#Preview {
    MotKCapsule()
}
