//
//  GroupBoxStyle.swift
//  RingsCards
//
//  Created by Christoph Freier on 22.02.24.
//

import SwiftUI

struct PlainGroupBoxStyle: GroupBoxStyle {
    func makeBody(configuration: Configuration) -> some View {
        VStack(alignment: .leading) {
            configuration.label
            configuration.content
        }
    }
}
