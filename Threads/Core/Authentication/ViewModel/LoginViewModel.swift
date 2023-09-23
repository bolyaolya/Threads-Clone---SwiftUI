//
//  LoginViewModel.swift
//  Threads
//
//  Created by Olya B on 18.09.2023.
//

import Foundation

class LoginViewModel: ObservableObject {
    @Published var email = ""
    @Published var password = ""
    
    @MainActor
    func loginUser() async throws {
        try await AuthService.shared.login(withEmail: email, password: password)
    }
}
