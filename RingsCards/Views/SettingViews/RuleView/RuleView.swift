//
//  RuleView.swift
//  RingsCards
//
//  Created by Christoph Freier on 11.02.24.
//

import SwiftUI
import SwiftData

struct RuleView: View {
    @Query var relatedRules: [Rule]
    var rule: Rule

    init(
        rule: Rule
    ) {
        self.rule = rule

        let predicate = Rule.predicate(
            searchText: "",
            filterRule: rule.seeAlso.map { $0.id }
        )
        _relatedRules = Query(filter: predicate, sort: \.name)
    }

    var body: some View {
        ScrollView {
            Text(rule.name)
                .font(.title)

            Divider()

            Text(.init(rule.text.iconsAndSpheres()))
                .font(Font.custom("SFUIText-Regular", size: 16))

            if !rule.seeAlso.isEmpty {
                LazyVStack(alignment: .leading) {
                    Text("See also")
                        .font(.headline)

                    ForEach(relatedRules) { rule in
                        NavigationLink(value: Router.ruleView(rule)) {
                            Text("∙ \(rule.name)")
                        }
                    }
                }
                .padding()
            }
        }
        .padding()
    }
}

//#Preview {
//    ModelPreview { rule in
//        RuleView(rule: rule)
//    }
//    .modelContainer(previewModelContainer)
//}
