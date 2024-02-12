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
        text = text.replacing("[unique]", with: "\u{E607}")
        text = text.replacing("[player]", with: "\u{E622}")

        text = text.replacing("[spirit]", with: "\u{E608}")
        text = text.replacing("[leadership]", with: "\u{E609}")
        text = text.replacing("[tactics]", with: "\u{E60A}")
        text = text.replacing("[lore]", with: "\u{E60B}")
        text = text.replacing("[baggins]", with: "\u{E60C}")
        text = text.replacing("[fellowship]", with: "\u{E60D}")
        text = text.replacing("[neutral]", with: "\u{E60E}")

        return text
    }
}
