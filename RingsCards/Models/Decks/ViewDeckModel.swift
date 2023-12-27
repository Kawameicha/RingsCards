//
//  ViewDeckModel.swift
//  RingsCards
//
//  Created by Christoph Freier on 16.12.23.
//

import Foundation
import SwiftData

@Observable
class ViewDeckModel {
    var sortDeckParameter: SortDeckParameter = .name
    var sortOrder: SortOrder = .forward
    var searchText: String = ""
}
