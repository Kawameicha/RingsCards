//
//  KeywordView.swift
//  RingsCards
//
//  Created by Christoph Freier on 29.10.23.
//

import SwiftUI

struct KeywordView: View {
    var keyword: Keyword

    var body: some View {
        ScrollView {
            Text(keyword.name)
                .font(.title)

            Divider()

            Text(.init(keyword.text.iconsAndSpheres()))
                .font(Font.custom("SFUIText-Regular", size: 16))
        }
        .padding()
    }
}

#Preview {
    ModelPreview { keyword in
        KeywordView(keyword: keyword)
    }
    .modelContainer(previewModelContainer)
}
