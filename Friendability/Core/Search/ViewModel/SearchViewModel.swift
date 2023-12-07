//
//  SearchViewModel.swift
//  Friendability
//
//  Created by Kwan Ching Nam on 26/11/2023.
//

import Foundation

class SearchViewModel: ObservableObject {
    @Published var users = [User]()
    
    init() {
        Task { try await fetchAllUsers() }
    }
    
    func fetchAllUsers() async throws {
        self.users = try await UserService.fetchAllUsers()
    }
}
