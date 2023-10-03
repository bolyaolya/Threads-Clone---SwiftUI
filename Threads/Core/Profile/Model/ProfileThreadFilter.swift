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
        case.threads: return "Threads".localized
        case.replies: return "Replies".localized
        }
    }
    
    var id: Int { return self.rawValue}
}
