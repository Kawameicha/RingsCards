//
//  ViewCampaignModel.swift
//  RingsCards
//
//  Created by Christoph Freier on 16.12.23.
//

import Foundation
import SwiftData

@Observable
class ViewCampaignModel {
    var sortCampaignParameter: SortCampaignParameter = .date_update
    var sortOrder: SortOrder = .forward
    var searchText: String = ""
}
