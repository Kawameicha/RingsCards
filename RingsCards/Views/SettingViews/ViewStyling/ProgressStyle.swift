//
//  ProgressStyle.swift
//  RingsCards
//
//  Created by Christoph Freier on 24.06.24.
//

import SwiftUI

struct ProgressStyle: ProgressViewStyle {
    func makeBody(configuration: Configuration) -> some View {
        let fractionCompleted = configuration.fractionCompleted ?? 0

        return ZStack {
            Circle()
                .trim(from: 0, to: 1)
                .stroke(Color.gray, style: StrokeStyle(lineWidth: 4.4, lineCap: .round))
                .rotationEffect(.degrees(-90))

            if fractionCompleted > 0 && fractionCompleted < 1 {
                Circle()
                    .trim(from: 0, to: (fractionCompleted + 0.01))
                    .stroke(Color.black, style: StrokeStyle(lineWidth: 4.4, lineCap: .round))
                    .opacity(0.3)
                    .rotationEffect(.degrees(-90))
            }

            Circle()
                .trim(from: 0, to: fractionCompleted)
                .stroke(Color.white, style: StrokeStyle(lineWidth: 4.4, lineCap: .round))
                .rotationEffect(.degrees(-90))
        }
    }
}
