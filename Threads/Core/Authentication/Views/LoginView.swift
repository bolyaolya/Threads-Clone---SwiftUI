//
//  LoginView.swift
//  Threads
//
//  Created by Olya B on 17.09.2023.
//

import SwiftUI

struct LoginView: View {
    @StateObject var viewModel = LoginViewModel()
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        NavigationStack {
            VStack {
                Spacer()
                
                if colorScheme == .dark {
                    Image("threads_icon_white")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 120, height: 120)
                        .padding()
                } else {
                    Image("threads_icon_black")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 120, height: 120)
                        .padding()
                }
                
                VStack {
                    TextField("Enter your email", text: $viewModel.email)
                        .modifier(ThreadsTextFieldModifier())
                    
                    SecureField("Enter your password", text: $viewModel.password)
                        .modifier(ThreadsTextFieldModifier())
                }
                
                NavigationLink {
                    
                } label: {
                    Text("Forgot password?")
                        .font(.footnote)
                        .fontWeight(.semibold)
                        .padding(.vertical)
                        .padding(.trailing, 28)
                        .foregroundColor(colorScheme == .dark ? Color.white : Color.black)
                        .frame(maxWidth: .infinity, alignment: .trailing)
                }
                
                Button {
                    Task { try await viewModel.loginUser() }
                } label: {
                    Text("Login")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .foregroundColor(colorScheme == .dark ? Color.black : Color.white)
                        .frame(width: 352, height: 44)
                        .background(colorScheme == .dark ? Color.white : Color.black)
                        .cornerRadius(8)
                }
                
                Spacer()
                Divider()
                    .background(colorScheme == .dark ? Color.white : Color.black)
                
                NavigationLink {
                    RegistrationView()
                        .navigationBarBackButtonHidden(true)
                } label: {
                    HStack(spacing: 3) {
                        Text("Don't have an account?")
                        Text("Sign Up")
                            .fontWeight(.semibold)
                    }
                    .foregroundColor(colorScheme == .dark ? Color.white : Color.black)
                    .font(.footnote)
                }
                .padding(.vertical, 16)
            }
        }
        
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
