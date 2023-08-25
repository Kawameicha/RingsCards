//
//  UserEdit.swift
//  RingsCards
//
//  Created by Christoph Freier on 24.08.23.
//

import SwiftUI

struct UserEdit: View {
    @Binding var user: User

    var body: some View {
        List {
            HStack {
                Text("Username").bold()
                Divider()
                TextField("Username", text: $user.username)
            }

            VStack(alignment: .leading, spacing: 20) {
                Text("Sphere").bold()

                Picker("Sphere", selection: $user.sphere) {
                    ForEach(User.Sphere.allCases) { sphere in
                        Text(sphere.rawValue).tag(sphere)
                    }
                }
                .pickerStyle(.segmented)
            }
        }
    }
}

struct UserEdit_Previews: PreviewProvider {
    static var previews: some View {
        UserEdit(user: .constant(.default))
    }
}
