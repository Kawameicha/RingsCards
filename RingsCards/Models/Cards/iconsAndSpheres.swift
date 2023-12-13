//
//  iconsAndSpheres.swift
//  RingsCards
//
//  Created by Christoph Freier on 26.11.23.
//

import SwiftUI
import RegexBuilder

extension String {
    func iconsAndSpheres() -> String {

        var text = self

        // Text formatting
        text = text.replacing("[willpower]", with: "\u{E600}")
        text = text.replacing("[attack]", with: "\u{E601}")
        text = text.replacing("[defense]", with: "\u{E602}")
        text = text.replacing("[health]", with: "\u{E603}")
        text = text.replacing("[threat]", with: "\u{E604}")

        return text
    }
}
