//
//  AboutSubView.swift
//  Threads
//
//  Created by Olya B on 03.10.2023.
//

import SwiftUI

struct AboutSubView: View {
    var body: some View {
        
        VStack(alignment: .leading) {
            Text("About Threads".localized)
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding(.bottom, 3)
            
            Text("Welcome to Threads – your personal space for seamless communication, sharing, and inspiration! Threads is a powerful and user-friendly messaging app designed to keep you connected with your friends, family, and colleagues. Share photos, videos, ideas, and more, all securely and effortlessly.".localized)
                .padding(.bottom, 10)
            
            Text("Key Features:".localized)
                .fontWeight(.bold)
                .font(.headline)
                .padding(.bottom, 3)
            Text("Swift & Secure Messaging:".localized)
                .fontWeight(.bold)
                .font(.subheadline)
                .padding(.bottom, 3)
            Text("Threads ensures swift and secure real-time messaging. Your personal data and messages are safeguarded with robust encryption, guaranteeing your complete privacy.".localized)
                .font(.footnote)
                .padding(.bottom, 5)
            
            Text("Multimedia Sharing:".localized)
                .fontWeight(.bold)
                .font(.subheadline)
                .padding(.bottom, 3)
            Text("Share photos, videos, audio recordings, GIFs, and files of any format. Threads supports various multimedia types, allowing you to express yourself fully.".localized)
                .font(.footnote)
            Spacer()
        }
        .padding()
    }
}

struct AboutSubView_Previews: PreviewProvider {
    static var previews: some View {
        AboutSubView()
    }
}
