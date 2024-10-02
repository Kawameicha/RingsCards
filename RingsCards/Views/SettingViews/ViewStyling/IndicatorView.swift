//
//  IndicatorView.swift
//  RingsCards
//
//  Created by Christoph Freier on 01.10.24.
//

import SwiftUI

struct IndicatorView: View {
    let scenarioCount: Int
    @Binding var scrollID: Int?

    var body: some View {
        HStack {
            ForEach(0..<scenarioCount, id: \.self) { indicator in
            let index = scrollID ?? 0
                Button {
                    withAnimation {
                        scrollID = indicator
                    }
                } label: {
                    Image(systemName: "circle.fill")
                        .font(.system(size: 8))
                        .foregroundStyle(indicator == index ? Color.yellow : Color(.lightGray))
                }
            }
        }
    }
}

#Preview {
    IndicatorView(scenarioCount: 9, scrollID: .constant(0))
}
