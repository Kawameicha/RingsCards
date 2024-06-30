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
        text = text.replacing(/\[willpower\]/.ignoresCase(), with: "\u{E600}")
        text = text.replacing(/\[attack\]/.ignoresCase(), with: "\u{E601}")
        text = text.replacing(/\[defense\]/.ignoresCase(), with: "\u{E602}")
        text = text.replacing(/\[health\]/.ignoresCase(), with: "\u{E603}")
        text = text.replacing(/\[threat\]/.ignoresCase(), with: "\u{E604}")
        text = text.replacing(/\[unique\]/.ignoresCase(), with: "\u{E607}")
        text = text.replacing(/\[player\]/.ignoresCase(), with: "\u{E622}")

        text = text.replacing(/\[spirit\]/.ignoresCase(), with: "\u{E608}")
        text = text.replacing(/\[leadership\]/.ignoresCase(), with: "\u{E609}")
        text = text.replacing(/\[tactics\]/.ignoresCase(), with: "\u{E60A}")
        text = text.replacing(/\[lore\]/.ignoresCase(), with: "\u{E60B}")
        text = text.replacing(/\[baggins\]/.ignoresCase(), with: "\u{E60C}")
        text = text.replacing(/\[fellowship\]/.ignoresCase(), with: "\u{E60D}")
        text = text.replacing(/\[neutral\]/.ignoresCase(), with: "\u{E60E}")

        return text
    }
}
