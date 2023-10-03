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
                    TextField("Enter your email".localized, text: $viewModel.email)
                        .modifier(ThreadsTextFieldModifier())
                    
                    SecureField("Enter your password".localized, text: $viewModel.password)
                        .modifier(ThreadsTextFieldModifier())
                }
                
                NavigationLink {
                    
                } label: {
                    Text("Forgot password?".localized)
                        .font(.footnote)
                        .fontWeight(.semibold)
                        .padding(.vertical)
                        .padding(.trailing, 28)
                        .foregroundColor(Color("black"))
                        .frame(maxWidth: .infinity, alignment: .trailing)
                }
                
                Button {
                    Task { try await viewModel.loginUser() }
                } label: {
                    Text("Login".localized)
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .foregroundColor(Color("white"))
                        .frame(width: 352, height: 44)
                        .background(Color("black"))
                        .cornerRadius(8)
                }
                
                Spacer()
                Divider()
                    .background(Color("black"))
                
                NavigationLink {
                    RegistrationView()
                        .navigationBarBackButtonHidden(true)
                } label: {
                    HStack(spacing: 3) {
                        Text("Don't have an account?".localized)
                        Text("Sign Up".localized)
                            .fontWeight(.semibold)
                    }
                    .foregroundColor(Color("black"))
                    .font(.footnote)
                }
                .padding(.vertical, 16)
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
