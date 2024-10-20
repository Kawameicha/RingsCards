//
//  IndicatorView.swift
//  RingsCards
//
//  Created by Christoph Freier on 01.10.24.
//

import SwiftUI

struct IndicatorView: View {
    let itemCount: Int
    @Binding var scrollID: Int?

    var body: some View {
        HStack {
            ForEach(0..<itemCount, id: \.self) { indicator in
            let index = scrollID ?? 0
                Button {
                    withAnimation {
                        scrollID = indicator
                    }
                } label: {
                    Image(systemName: "circle.fill")
                        .font(.system(size: 8))
                        .foregroundStyle(indicator == index ? Color.accent : Color(.lightGray))
                }
            }
        }
    }
}

#Preview {
    IndicatorView(itemCount: 9, scrollID: .constant(0))
}
