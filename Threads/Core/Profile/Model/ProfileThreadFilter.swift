//
//  ProfileThreadFilter.swift
//  Threads
//
//  Created by Olya B on 18.09.2023.
//

import Foundation

enum ProfileThreadFilter: Int, CaseIterable, Identifiable {
    case threads
    case replies
    
    var title: String {
        switch self {
        case.threads: return "Threads"
        case.replies: return "Replies"
        }
    }
    
    var id: Int { return self.rawValue}
}
