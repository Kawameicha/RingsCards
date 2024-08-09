//
//  TransitionStyle.swift
//  RingsCards
//
//  Created by Christoph Freier on 09.08.24.
//

import SwiftUI

struct TransitionStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .scrollTransition { content, phase in
                content
                    .opacity(phase.isIdentity ? 1 : 0)
                    .scaleEffect(phase.isIdentity ? 1 : 0.75)
                    .blur(radius: phase.isIdentity ? 0 : 10)
            }
    }
}

extension View {
    func transitionStyle() -> some View {
        self.modifier(TransitionStyle())
    }
}
