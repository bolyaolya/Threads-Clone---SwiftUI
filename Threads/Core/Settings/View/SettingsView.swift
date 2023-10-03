//
//  SettingsView.swift
//  Threads
//
//  Created by Olya B on 21.09.2023.
//

import SwiftUI

struct SettingsView: View {
    
    @State private var darkTheme = false
    
    var body: some View {
        NavigationStack {
            
            VStack(alignment: .leading) {
                
                Toggle("Dark Theme".localized, isOn: $darkTheme)
                    .onChange(of: darkTheme) { newValue in
                        if let windowScene = UIApplication.shared.windows.first?.windowScene {
                            windowScene.keyWindow?.overrideUserInterfaceStyle = newValue ? .dark : .light
                        }
                    }
                    .padding()
                
                
                NavigationLink(destination: NotificationSubView()) {
                    SettingsRow(systemInageName: "bell.circle", text: "Notifications".localized)
                }
                
                NavigationLink(destination: HelpSubView()) {
                    SettingsRow(systemInageName: "questionmark.circle", text: "Help".localized)
                }

                NavigationLink(destination: AboutSubView()) {
                    SettingsRow(systemInageName: "info.circle", text: "About".localized)
                }
                
                Button {
                    AuthService.shared.signOut()
                } label: {
                    Text("Log out".localized)
                        .font(.system(size: 18))
                        .foregroundColor(Color("black"))
                        .padding(.leading, 16)
                }
                Spacer()
            }
            .padding(.top)
            .navigationTitle("Settings".localized)
            .navigationBarTitleDisplayMode(.inline)
        }
        .tint(Color("black"))
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
