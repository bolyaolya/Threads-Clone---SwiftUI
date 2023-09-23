//
//  RegistrationView.swift
//  Threads
//
//  Created by Olya B on 17.09.2023.
//

import SwiftUI

struct RegistrationView: View {
    @StateObject var viewModel = RegistrationViewModel()
    @Environment(\.dismiss) var dismiss
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
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
                    .autocapitalization(.none)
                    .modifier(ThreadsTextFieldModifier())
                
                SecureField("Enter your password", text: $viewModel.password)
                    .modifier(ThreadsTextFieldModifier())
                
                TextField("Enter your full name", text: $viewModel.fullname)
                    .autocorrectionDisabled()
                    .modifier(ThreadsTextFieldModifier())
                
                TextField("Enter your username", text: $viewModel.username)
                    .autocapitalization(.none)
                    .autocorrectionDisabled()
                    .modifier(ThreadsTextFieldModifier())
            }
            
            Button {
                Task { try await viewModel.createUser() }
            } label: {
                Text("Sign Up")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundColor(colorScheme == .dark ? Color.black : Color.white)
                    .frame(width: 352, height: 44)
                    .background(colorScheme == .dark ? Color.white : Color.black)
                    .cornerRadius(8)
            }
            .padding(.vertical)
            
            Spacer()
            Divider()
                .background(colorScheme == .dark ? Color.white : Color.black)
            
            NavigationLink(destination: LoginView(), label: {
                HStack(spacing: 3) {
                    Text("Already have an account?")
                    Text("Sign In")
                        .fontWeight(.semibold)
                }
                .foregroundColor(colorScheme == .dark ? Color.white : Color.black)
                .font(.system(size: 16))
            })
            .padding(.vertical, 16)
        }
    }
}

struct RegistrationView_Previews: PreviewProvider {
    static var previews: some View {
        RegistrationView()
    }
}
