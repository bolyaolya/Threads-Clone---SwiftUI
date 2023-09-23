//
//  ColorBackButton.swift
//  Threads
//
//  Created by Olya B on 23.09.2023.
//

import SwiftUI

@available(iOS 14.0, *)
extension View {
    func navigationBackButtonStyle(_ style: any ButtonStyle) -> some View {
        self.modifier(NavigationBackButtonStyleModifier(buttonStyle: style))
    }
}
@available(iOS 14.0, *)
struct NavigationBackButtonStyleModifier: ViewModifier {
    @Environment(\.colorScheme) var colorScheme // Получаем текущую цветовую схему
    let buttonStyle: ButtonStyle
    
}
