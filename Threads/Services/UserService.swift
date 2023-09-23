//
//  UserService.swift
//  Threads
//
//  Created by Olya B on 18.09.2023.
//

import Firebase
import FirebaseFirestoreSwift

class UserService {
    @Published var currentUser: User?
    static let shared = UserService()
    
    init() {
        Task { try await fetchCurrentUser() }
    }
    
    @MainActor
    func fetchCurrentUser() async throws {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        let snapchot = try await Firestore.firestore().collection(FirebaseConstants.users).document(uid).getDocument()
        let user = try snapchot.data(as: User.self)
        self.currentUser = user
    }
    
    static func fetchUsers() async throws -> [User] {
        guard let currentUid = Auth.auth().currentUser?.uid else { return [] }
        let snapshot = try await Firestore.firestore().collection(FirebaseConstants.users).getDocuments()
        let users = snapshot.documents.compactMap({ try? $0.data(as: User.self) })
        return users.filter({ $0.id != currentUid })
    }
    
    static func fetchUser(withUid uid: String) async throws -> User {
        let snapchot = try await Firestore.firestore().collection(FirebaseConstants.users).document(uid).getDocument()
        return try snapchot.data(as: User.self)
    }
    
    func reset() {
        self.currentUser = nil
    }
    
    @MainActor
    func updateUserProfileImage(withImageUrl imageUrl: String) async throws {
        guard let currentUid = Auth.auth().currentUser?.uid else { return }
        try await Firestore.firestore().collection(FirebaseConstants.users).document(currentUid).updateData([
            FirebaseConstants.profileImageUrl: imageUrl
        ])
        self.currentUser?.profileImageUrl = imageUrl
    }
}
