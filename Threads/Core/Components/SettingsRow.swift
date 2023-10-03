//
//  SettingsRow.swift
//  Threads
//
//  Created by Olya B on 29.09.2023.
//

import SwiftUI

struct SettingsRow: View {
    let systemInageName: String
    let text: String
    
    var body: some View {
        HStack {
            Image(systemName: systemInageName)
                .resizable()
                .scaledToFill()
                .frame(width: 35, height: 35)
                .padding(.trailing, 8)
            Text(text)
                .font(.system(size: 20))
            Spacer()
        }
        .padding(16)
    }
}
