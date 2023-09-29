//
//  ViewModel.swift
//  RingsCards
//
//  Created by Christoph Freier on 28.09.23.
//

import Foundation
import SwiftData

@Observable
class ViewModel {
    var filterSphere: FilterSphere = .all
    var filterType: FilterType = .any
    var sortParameter: SortParameter = .name
    var sortOrder: SortOrder = .forward
    var searchText: String = ""
}
