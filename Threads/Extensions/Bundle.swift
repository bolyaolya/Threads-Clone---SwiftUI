//
//  Bundle.swift
//  Threads
//
//  Created by Olya B on 03.10.2023.
//

import Foundation

extension Bundle {
    private static var bundleKey: UInt8 = 0
    
    static func setLanguage(_ language: String) {
        objc_setAssociatedObject(Bundle.main, &bundleKey, Bundle(path: Bundle.main.path(forResource: language, ofType: "lproj")!), .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
    }
    
    static var currentLanguage: String {
        guard let path = Bundle.main.path(forResource: nil, ofType: "lproj"),
              let language = path.components(separatedBy: "-").last?.components(separatedBy: "_").first else {
            return ""
        }
        return language
    }
}
