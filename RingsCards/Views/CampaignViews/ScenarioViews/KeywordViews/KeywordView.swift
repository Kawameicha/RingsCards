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
        VStack(alignment: .leading) {
                VStack {
                    Text(keyword.name)
                        .font(.title)
                }
                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .center)

            Divider()

            ScrollView {
                Text(.init(keyword.text))
            }
        }
        .padding()
    }
}

#Preview {
    ModelPreview { keyword in
        KeywordView(keyword: keyword)
    }
    .environment(ViewModel())
    .modelContainer(previewModelContainer)
}
