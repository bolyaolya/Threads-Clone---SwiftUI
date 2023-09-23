//
//  ThreadCell.swift
//  Threads
//
//  Created by Olya B on 17.09.2023.
//

import SwiftUI

struct ThreadCell: View {
    let thread: Thread
    @State private var likeButtonPressed = false
    @Environment(\.colorScheme) var colorScheme
    
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
                        
                        Button {
                            
                        } label: {
                            Image(systemName: "ellipsis")
                                .foregroundColor(Color(.darkGray))
                        }

                    }
                    
                    Text(thread.caption)
                        .font(.footnote)
                        .multilineTextAlignment(.leading)
                    
                    HStack(spacing: 16) {
                        Button {
                            likeButtonPressed.toggle()
                        } label: {
                            if likeButtonPressed {
                                Image(systemName: likeButtonPressed ? "heart.fill" : "heart")
                                    .foregroundColor(.red)
                            } else {
                                Image(systemName: likeButtonPressed ? "heart.fill" : "heart")
                                    .foregroundColor(colorScheme == .dark ? Color.white : Color.black)
                            }
                        }
                        
                        Button {
                            
                        } label: {
                            Image(systemName: "bubble.right")
                                .foregroundColor(colorScheme == .dark ? Color.white : Color.black)
                        }
                        
                        Button {
                            
                        } label: {
                            Image(systemName: "arrow.rectanglepath")
                                .foregroundColor(colorScheme == .dark ? Color.white : Color.black)
                        }
                        
                        Button {
                            
                        } label: {
                            Image(systemName: "paperplane")
                                .foregroundColor(colorScheme == .dark ? Color.white : Color.black)
                        }
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
