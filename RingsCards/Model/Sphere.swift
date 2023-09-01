//
//  Sphere.swift
//  RingsCards
//
//  Created by Christoph Freier on 01.09.23.
//

import Foundation

struct Sphere: Hashable, Identifiable {
    let id = UUID()
    let name: String
    var filterIn = true
}
