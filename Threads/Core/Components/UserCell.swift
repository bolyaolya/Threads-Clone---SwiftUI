//
//  UserCell.swift
//  Threads
//
//  Created by Olya B on 17.09.2023.
//

import SwiftUI

struct UserCell: View {
    @Environment(\.colorScheme) var colorScheme
    
    let user: User
    
    var body: some View {
        HStack {
            CircularProfileImageView(user: user, size: .small)
            
            VStack(alignment: .leading, spacing: 2) {
                Text(user.username)
                    .fontWeight(.semibold)
                Text(user.fullname)
            }
            .foregroundColor(colorScheme == .dark ? Color.white : Color.black)
            .font(.footnote)
            Spacer()
            
            Text("Follow")
                .font(.subheadline)
                .fontWeight(.semibold)
                .frame(width: 100, height: 32)
                .foregroundColor(colorScheme == .dark ? Color.white : Color.black)
                .overlay {
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color(.systemGray4),lineWidth: 1)
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