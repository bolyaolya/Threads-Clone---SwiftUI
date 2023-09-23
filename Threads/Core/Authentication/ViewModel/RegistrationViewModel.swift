//
//  RegistrationViewModel.swift
//  Threads
//
//  Created by Olya B on 18.09.2023.
//

import Foundation

class RegistrationViewModel: ObservableObject {
    @Published var email = ""
    @Published var password = ""
    @Published var fullname = ""
    @Published var username = ""
    
    @MainActor
    func createUser() async throws {
        try await AuthService.shared.createUser(withEmail: email,
                                                password: password,
                                                fullname: fullname,
                                                username: username)
    }
}
