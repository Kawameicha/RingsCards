//
//  AppDetailColumn.swift
//  RingsCards
//
//  Created by Christoph Freier on 01.01.24.
//

import SwiftUI
import SwiftData

struct AppDetailColumn: View {
    var screen: AppScreen?
    
    var body: some View {
        Group {
            if let screen {
                screen.destination
            } else {
                ContentUnavailableView("Hoping for Scraps", systemImage: "dog.fill", description: Text("Pick something from the list."))
            }
        }
    }
}

#Preview {
    AppDetailColumn()
}
