//
//  UserService.swift
//  Friendability
//
//  Created by Kwan Ching Nam on 26/11/2023.
//

import Foundation
import Firebase
import FirebaseFirestore

struct UserService {
    
    static func fetchUser(widthUid uid: String) async throws -> User {
        let snapshot = try await Firestore.firestore().collection("users").document(uid).getDocument()
        return try snapshot.data(as: User.self)
    }
        
    
    static func fetchAllUsers() async throws -> [User] {
        let snapshot = try await Firestore.firestore().collection("users").getDocuments()
        return snapshot.documents.compactMap({ try? $0.data(as: User.self) })
    }
}

