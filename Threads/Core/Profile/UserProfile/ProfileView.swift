//
//  ProfileView.swift
//  Threads
//
//  Created by Olya B on 17.09.2023.
//

import SwiftUI

struct ProfileView: View {
    @State private var isFollowing = false
    let user: User
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            //bio and stats
            VStack(spacing: 20) {
                ProfileHeaderView(user: user)
                
                Button {
                    isFollowing.toggle()
                } label: {
                    Text(isFollowing ? "Unfollow".localized : "Follow".localized)
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .frame(width: 352, height: 32)
                        .background(.black)
                        .cornerRadius(8)
                }
                //user content list view
                UserContentListView(user: user)
            }
        }
        .navigationBarTitleDisplayMode(.inline)
        .padding(.horizontal)
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView(user: dev.user)
    }
}
