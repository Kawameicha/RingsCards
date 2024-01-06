////
////  UserView.swift
////  RingsCards
////
////  Created by Christoph Freier on 24.08.23.
////
//
//import SwiftUI
//
//struct UserView: View {
//    var user: User
//
//    var body: some View {
//        ScrollView {
//            VStack(alignment: .leading, spacing: 10) {
//                Text(user.username)
//                    .bold()
//                    .font(.title)
//
//                Text("Sphere: \(user.sphere.rawValue)")
//                Text("Created: ") + Text(user.created, style: .date)
//            }
//        }
//    }
//}
//
//struct UserView_Previews: PreviewProvider {
//    static var previews: some View {
//        UserView(user: User.default)
//    }
//}
