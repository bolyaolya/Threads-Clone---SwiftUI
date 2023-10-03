//
//  FirstScreenView.swift
//  Threads
//
//  Created by Olya B on 21.09.2023.
//

import SwiftUI

struct FirstScreenView: View {
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        NavigationStack {
            VStack {
                Image("logo")
                    .resizable()
                    .edgesIgnoringSafeArea(.top)
                
                Spacer()
                
                NavigationLink {
                    RegistrationView()
                        .navigationBarBackButtonHidden(true)
                } label: {
                    HStack {
                        Text("Login with Email".localized)
                            .font(.system(size: 18))
                            .foregroundColor(Color("black"))
                        Spacer()
                        Image("google-icon")
                            .resizable()
                            .frame(width: 46, height: 46)
                    }
                    .padding(16)
                    .overlay(content: {
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(colorScheme == .dark ? Color.white : Color(.systemGray5), lineWidth: 1)
                    })
                    .padding(16)
                }
            }
        }
        .tint(Color("black"))
    }
}

struct FirstScreenView_Previews: PreviewProvider {
    static var previews: some View {
        FirstScreenView()
    }
}
