//
//  SettingsView.swift
//  Threads
//
//  Created by Olya B on 21.09.2023.
//

import SwiftUI

struct SettingsView: View {
    
    @Environment(\.colorScheme) var colorScheme: ColorScheme
    
    var body: some View {
        NavigationStack {
            
            VStack(alignment: .leading) {
                
                Toggle("Dark Mode".localized, isOn: Binding(
                                get: { self.colorScheme == .dark },
                                set: { newValue in
                                    if let windowScene = UIApplication.shared.connectedScenes.first(where: { $0 is UIWindowScene }) as? UIWindowScene {
                                        windowScene.windows.forEach { window in
                                            window.overrideUserInterfaceStyle = newValue ? .dark : .light
                                        }
                                    }
                                }
                            ))
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
