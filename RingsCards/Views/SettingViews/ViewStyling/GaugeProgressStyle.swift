//
//  GaugeProgressStyle.swift
//  RingsCards
//
//  Created by Christoph Freier on 24.06.24.
//

import SwiftUI

struct GaugeProgressStyle: ProgressViewStyle {
    func makeBody(configuration: Configuration) -> some View {
        let fractionCompleted = configuration.fractionCompleted ?? 0

        return ZStack {
            Circle()
                .trim(from: 0, to: fractionCompleted)
                .stroke(Color.white, style: StrokeStyle(lineWidth: 4.4, lineCap: .round))
                .rotationEffect(.degrees(-90))
        }
    }
}
