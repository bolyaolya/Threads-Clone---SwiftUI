//
//  HelpSubView.swift
//  Threads
//
//  Created by Olya B on 03.10.2023.
//

import SwiftUI

struct HelpSubView: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("Help and Support".localized)
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding(.bottom, 3)
            
            Text("Need assistance? Our dedicated support team is here to help you. Whether you have questions about using Threads, encountering issues, or need guidance on specific features, we're just a message away. Contact us anytime through the app, and we'll provide you with prompt and friendly assistance.".localized)
                .padding(.bottom, 5)
            Text("For quick solutions, check out our FAQs section, where you can find answers to common queries. We're committed to ensuring your experience with Threads is smooth and enjoyable. Your satisfaction is our priority. Reach out to us and let us assist you today!".localized)
            Spacer()
        }
        .padding()
    }
}

struct HelpSubView_Previews: PreviewProvider {
    static var previews: some View {
        HelpSubView()
    }
}
