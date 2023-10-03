//
//  UserCell.swift
//  Threads
//
//  Created by Olya B on 17.09.2023.
//

import SwiftUI

struct UserCell: View {
    @State private var isFollowing = false
    let user: User
    
    var body: some View {
        HStack {
            CircularProfileImageView(user: user, size: .small)
            
            VStack(alignment: .leading, spacing: 2) {
                Text(user.username)
                    .fontWeight(.semibold)
                Text(user.fullname)
            }
            .foregroundColor(Color("black"))
            .font(.footnote)
            Spacer()
            
            Button {
                isFollowing.toggle()
            } label: {
                Text(isFollowing ? "Unfollow" : "Follow")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundColor(Color("black"))
                    .frame(width: 100, height: 32)
                    .background(Color("white"))
                    .cornerRadius(8)
                    .overlay {
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color(.systemGray4),lineWidth: 1)
                    }
            } 
        }
        .padding(.horizontal)
    }
}

struct UserCell_Previews: PreviewProvider {
    static var previews: some View {
        UserCell(user: dev.user)
    }
}
