//
//  ViewCardModel.swift
//  RingsCards
//
//  Created by Christoph Freier on 28.09.23.
//

import Foundation
import SwiftData

@Observable
class ViewCardModel {
    var filterSphere: FilterSphere = .all
    var filterType: FilterType = .any
    var filterPack: [String] = []
    var filterDeck: [String] = []
    var sortParameter: SortParameter = .name
    var sortOrder: SortOrder = .forward
    var searchText: String = ""
    var offset: Int = 1
}
