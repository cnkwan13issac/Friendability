//
//  LoginViewModel.swift
//  Friendability
//
//  Created by Kwan Ching Nam on 25/11/2023.
//

import Foundation

class LoginViewModel: ObservableObject {
    @Published var email = ""
    @Published var password = ""
    
    func signIn() async throws {
        try await AuthService.shared.login(withEmail: email, password: password)
    }
}

