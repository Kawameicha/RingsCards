//
//  SupportHome.swift
//  RingsCards
//
//  Created by Christoph Freier on 30.01.24.
//

import SwiftUI

struct SupportHome: View {
    var body: some View {
        VStack {
            Text("About Rings Cards")
                .font(.title)

            Divider()

            ScrollView {
                Text("The information presented in this application about The Lord of the Rings: The Card Game, both literal and graphical, is copyrighted by Fantasy Flight Games. The Lord of the Rings, and the characters, items, events and places therein are trademarks or registered trademarks of The Saul Zaentz Company d/b/a Middle-earth Enterprises and are used, under license, by Fantasy Flight Games. This application is not produced, endorsed, supported, or affiliated with Fantasy Flight Games.\n\nThis application was created by Christoph Freier as a fan project to help support The Lord of the Rings: The Card Game community.\n\nFeedback and bugs reports are welcome by email at ringscards@gmail.com\n\nMany thanks to RingsDB.com for providing the structured data, API access and access to card images. Much of this work wouldn't have been possible without Hall of Beorn and previous work of the community.")
            }
        }
        .padding()
    }
}

#Preview {
    SupportHome()
}
