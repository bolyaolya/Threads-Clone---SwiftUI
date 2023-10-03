//
//  ThreadCell.swift
//  Threads
//
//  Created by Olya B on 17.09.2023.
//

import SwiftUI

struct ThreadCell: View {
    let thread: Thread
    @State private var isLiked = false
    @State private var likeCount = 0
    let localizedLikes = "countLikes".localized
    
    var body: some View {
        
        VStack {
            HStack(alignment: .top, spacing: 12) {
                CircularProfileImageView(user: thread.user, size: .small)
                
                VStack(alignment: .leading, spacing: 4) {
                    HStack {
                        Text(thread.user?.username ?? "")
                            .font(.footnote)
                        .fontWeight(.semibold)
                        
                        Spacer()
                        
                        Text(thread.timestamp.timestampString())
                            .font(.caption)
                            .foregroundColor(Color(.systemGray3))
                    }
                    
                    Text(thread.caption)
                        .font(.footnote)
                        .multilineTextAlignment(.leading)
                    
                    HStack(spacing: 8) {
                        Button {
                            if isLiked {
                                likeCount -= 1
                            } else {
                                likeCount += 1
                            }
                            isLiked.toggle()
                        } label: {
                            Image(systemName: isLiked ? "heart.fill" : "heart")
                                .foregroundColor(isLiked ? .red : Color("black"))
                        }
                        
                        Text(String(format: localizedLikes, Int(likeCount)))
                            .font(.system(size: 12))
                            .foregroundColor(Color(.systemGray))
                    }
                    .foregroundColor(.black)
                    .padding(.vertical, 8)
                }
            }
            Divider()
        }
        .padding()
    }
}

struct ThreadCell_Previews: PreviewProvider {
    static var previews: some View {
        ThreadCell(thread: dev.thread)
    }
}
