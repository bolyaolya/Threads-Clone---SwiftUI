//
//  SettingsView.swift
//  Threads
//
//  Created by Olya B on 21.09.2023.
//

import SwiftUI

struct SettingsView: View {
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading) {
                HStack {
                    Image(systemName: "person.crop.circle.badge.plus")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 32, height: 32)
                        .padding(.trailing, 8)
                    Text("Follow and invite friends")
                        .font(.system(size: 20))
                    Spacer()
                }
                .padding(.leading, 16)
                
                HStack {
                    Image(systemName: "bell.circle")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 35, height: 35)
                        .padding(.trailing, 8)
                    Text("Notifications")
                        .font(.system(size: 20))
                    Spacer()
                }
                .padding(16)
                
                HStack {
                    Image(systemName: "lock.circle")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 35, height: 35)
                        .padding(.trailing, 8)
                    Text("Privacy")
                        .font(.system(size: 20))
                    Spacer()
                }
                .padding(16)
                
                HStack {
                    Image(systemName: "person.circle")
                        .resizable()
                        .frame(width: 35, height: 35)
                        .padding(.trailing, 8)
                    Text("Account")
                        .font(.system(size: 20))
                    Spacer()
                }
                .padding(16)
                    
                HStack {
                    Image(systemName: "questionmark.circle")
                        .resizable()
                        .frame(width: 35, height: 35)
                        .padding(.trailing, 8)
                    Text("Help")
                        .font(.system(size: 20))
                    Spacer()
                }
                .padding(16)
                
                HStack {
                    Image(systemName: "info.circle")
                        .resizable()
                        .frame(width: 35, height: 35)
                        .padding(.trailing, 8)
                    Text("About")
                        .font(.system(size: 20))
                    Spacer()
                }
                .padding(16)
                
                Button {
                    AuthService.shared.signOut()
                } label: {
                    Text("Log out")
                        .font(.system(size: 18))
                        .foregroundColor(colorScheme == .dark ? Color.white : Color.black)
                        .padding(.leading, 16)
                }
                Spacer()
            }
            .padding(.top)
            .navigationTitle("Settings")
            .navigationBarTitleDisplayMode(.inline)
        }
        
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
