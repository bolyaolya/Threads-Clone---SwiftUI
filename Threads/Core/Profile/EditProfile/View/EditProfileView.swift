//
//  EditProfileView.swift
//  Threads
//
//  Created by Olya B on 18.09.2023.
//

import SwiftUI
import PhotosUI

struct EditProfileView: View {
    let user: User
    
    @State private var bio = ""
    @State private var link = ""
    @State private var isPrivateProfile = false
    @Environment(\.dismiss) var dismiss
    @StateObject var viewModel = EditProfileViewModel()
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color(.systemGroupedBackground)
                    .edgesIgnoringSafeArea([.bottom, .horizontal])
                VStack {
                    //name and profile image
                    HStack {
                        VStack(alignment: .leading) {
                            Text("Name".localized)
                                .fontWeight(.semibold)
                            
                            Text(user.fullname)
                        }
                        Spacer()
                        
                        PhotosPicker(selection: $viewModel.selectedItem) {
                            if let image = viewModel.profileImage {
                                image
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 40, height: 40)
                                    .clipShape(Circle())
                            } else {
                                CircularProfileImageView(user: user, size: .small)
                            }
                        }
                    }
                    Divider()
                    
                    //bio field
                    VStack(alignment: .leading) {
                        Text("Bio".localized)
                            .fontWeight(.semibold)
                        TextField("Enter your bio...".localized, text: $bio, axis: .vertical)
                    }
                    
                    Divider()
                    
                    //link field
                    VStack(alignment: .leading) {
                        Text("Link".localized)
                            .fontWeight(.semibold)
                        TextField("+ Add link...".localized, text: $link)
                    }
                    
                    Divider()
                    
                    Toggle("Private profile".localized, isOn: $isPrivateProfile)
                }
                .font(.footnote)
                .padding()
                .background(.white)
                .cornerRadius(10)
                .overlay(content: {
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color(.systemGray4), lineWidth: 1)
                })
                .padding()
            }
            .navigationTitle("Edit Profile".localized)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Cancel".localized) {
                        dismiss()
                    }
                    .font(.subheadline)
                    .foregroundColor(.black)
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Done".localized) {
                        Task { try await viewModel.updateUserData() }
                        dismiss()
                    }
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundColor(.black)
                }
            }
        }
        .tint(Color("black"))
    }
}

struct EditProfileView_Previews: PreviewProvider {
    static var previews: some View {
        EditProfileView(user: dev.user)
    }
}
