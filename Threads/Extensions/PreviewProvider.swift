//
//  PreviewProvider.swift
//  Threads
//
//  Created by Olya B on 19.09.2023.
//

import SwiftUI
import Firebase

extension PreviewProvider {
    static var dev: DeveloperPreview {
        return DeveloperPreview.shared
    }
}

class DeveloperPreview {
    static let shared = DeveloperPreview()
    
    let user = User(id: NSUUID().uuidString, fullname: "Max Verstappen", email: "max@gmail.com", username: "maxverstappen")
    
    let thread = Thread(ownerUid: "123", caption: "This is a test thread", timestamp: Timestamp() , likes: 0)
}
