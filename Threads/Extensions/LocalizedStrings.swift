//
//  LocalizedStrings.swift
//  Threads
//
//  Created by Olya B on 21.09.2023.
//

import Foundation

extension String {
    var localized: String {
        NSLocalizedString(self, comment: "")
    }
}
