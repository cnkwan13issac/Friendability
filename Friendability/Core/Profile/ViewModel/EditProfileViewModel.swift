//
//  EditProfileViewModel.swift
//  Friendability
//
//  Created by Kwan Ching Nam on 26/11/2023.
//

import PhotosUI
import FirebaseFirestore
//import Firebase
import SwiftUI

@MainActor
class EditProfileViewModel: ObservableObject {
    @Published var user: User
    
    @Published var selectedImage: PhotosPickerItem? {
        didSet { Task { await loadImage(fromItem: selectedImage) } }
    }
    @Published var profileImage: Image?
    
    @Published var fullname = ""
//    @Published var bio = ""
    @Published var hobbies = ""
    @Published var location = ""
    @Published var difficulty = ""

    
    private var uiImage: UIImage?
    
    init(user: User) {
        self.user = user
        
        if let fullname = user.fullname {
            self.fullname = fullname
        }
        
        if let hobbies = user.hobbies {
            self.hobbies = hobbies
        }
        
        if let location = user.location {
            self.location = location
        }
        
        if let difficulty = user.difficulty {
            self.difficulty = difficulty
        }
    }
    
    func loadImage(fromItem item: PhotosPickerItem?) async {
        guard let item = item else { return }
        
        guard let data = try? await item.loadTransferable(type: Data.self) else { return }
        guard let uiImage = UIImage(data: data) else { return }
        self.uiImage = uiImage
        self.profileImage = Image(uiImage: uiImage)
    }
    
    func updateUserData() async throws {
        // update profile image if changed
        
        var data = [String: Any]()
        
        if let uiImage = uiImage {
            let imageUrl = try? await ImageUploader.uploadImage(image: uiImage)
            data["profileImageUrl"] = imageUrl
        }
        
        // update name if changed
        if !fullname.isEmpty && user.fullname != fullname {
            data["fullname"] = fullname
        }
        
        
        // update hobbies if changed
        if !hobbies.isEmpty && user.hobbies != hobbies {
            data["hobbies"] = hobbies
        }
        
        // update location if changed
        if !location.isEmpty && user.location != location {
            data["location"] = location
        }
        
        // update difficulty if changed
        if !difficulty.isEmpty && user.difficulty != difficulty {
            data["difficulty"] = difficulty
            
        } 
        if !data.isEmpty {
            try await Firestore.firestore().collection("users").document(user.id).updateData(data)
        }
        
        
    }
}
