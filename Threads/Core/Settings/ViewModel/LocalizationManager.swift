//
//  LocalizationManager.swift
//  Threads
//
//  Created by Olya B on 30.09.2023.
//

import Foundation

class LanguageSettings: ObservableObject {
    @Published var currentLanguage: Language = .english
    
//    private init() {
//        self.currentLanguage = UserDefaults.standard.string(forKey: "appLanguage") ?? Locale.preferredLanguages.first ?? "en"
//    }
//
//    var supportedLanguages : [String] = [SupportedLanguage.english.rawValue, SupportedLanguage.russian.rawValue]
//
//    func setLanguage(_ language: SupportedLanguage) {
//        currentLanguage = language.rawValue
//    }
}
