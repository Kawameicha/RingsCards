/*
See the LICENSE.txt file for this sample’s licensing information.

Abstract:
The detail column of the split view.
*/

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
