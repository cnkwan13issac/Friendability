//
//  FeedViewModel.swift
//  Friendability
//
//  Created by Kwan Ching Nam on 2/12/2023.
//

import Foundation
import FirebaseFirestore

class FeedViewModel: ObservableObject {
    @Published var posts = [Post]()
    
    init() {
        Task{ try await fetchPosts() }
    }
    
    @MainActor
    func fetchPosts() async throws {
        self.posts = try await PostService.fetchFeedPosts()
    }
}
