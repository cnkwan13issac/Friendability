//
//  User.swift
//  Friendability
//
//  Created by Kwan Ching Nam on 24/11/2023.
//

import Foundation
import FirebaseAuth

struct User: Identifiable, Hashable, Codable {
    let id: String
    var username: String
    var profileImageUrl: String?
    var fullname: String?
    var hobbies: String?
    var location: String?
    var difficulty: String?
    let email: String
    
    var isCurrentUser: Bool {
        guard let currentUid = Auth.auth().currentUser?.uid else { return false }
        return currentUid == id 
    }
}

extension User {
    static var MOCK_USERS: [User] = [
        .init(id: NSUUID().uuidString, username: "Amy", profileImageUrl: nil, fullname: "Amy Amy", hobbies: "Baking", location: "London", difficulty: "Walking", email: "amy@gamil.com"),
        .init(id: NSUUID().uuidString, username: "Susuan", profileImageUrl: nil, fullname: "Susuan Susuan", hobbies: "Running", location: "Oxford", difficulty: "Talking", email: "susuan@gamil.com"),
        .init(id: NSUUID().uuidString, username: "Yeung", profileImageUrl: nil, fullname: "Yeung Yeung", hobbies: "Running", location: "Bristol", difficulty: "Washing and dressing", email: "yeung@gamil.com"),
        .init(id: NSUUID().uuidString, username: "David", profileImageUrl: nil, fullname: "David David", hobbies: "Drawing", location: "Manchester", difficulty: "Using stairs", email: "david@gamil.com"),
        .init(id: NSUUID().uuidString, username: "Ali", profileImageUrl: nil, fullname: "Ali Ali", hobbies: "Tennis", location: "Cardiff", difficulty: "Cooking", email: "ali@gamil.com"),

    ]
}
