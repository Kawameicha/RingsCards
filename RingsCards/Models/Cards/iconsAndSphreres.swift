//
//  iconsAndSphreres.swift
//  RingsCards
//
//  Created by Christoph Freier on 26.11.23.
//

import SwiftUI
import RegexBuilder

extension String {
    func iconsAndSphreres() -> String {

        var text = self

        // Text formatting
        text = text.replacing("[attack]", with: "⚔️")
        text = text.replacing("[defense]", with: "🛡️")
        text = text.replacing("[willpower]", with: "☀️")

        return text
    }
}
