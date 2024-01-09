//
//  KeywordList.swift
//  RingsCards
//
//  Created by Christoph Freier on 09.01.24.
//

import SwiftUI
import SwiftData

struct KeywordList: View {
    @Environment(\.modelContext) private var modelContext
    @Query(sort: \Keyword.name) private var keywords: [Keyword]

    var body: some View {
        List {
            ForEach(keywords) { keyword in
                NavigationLink {
                    KeywordView(keyword: keyword)
                } label: {
                    Text("\(keyword.name)")
                }
            }
        }
        .navigationTitle("Keywords")
    }
}

#Preview {
    KeywordList()
        .modelContainer(previewModelContainer)
}
