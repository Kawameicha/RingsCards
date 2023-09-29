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
    var sortParameter: SortParameter = .name
    var filterParameter: FilterParameter = .all
    var sortOrder: SortOrder = .forward
    var searchText: String = ""
}
