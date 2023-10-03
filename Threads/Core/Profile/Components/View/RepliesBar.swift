//
//  RepliesBar.swift
//  Threads
//
//  Created by Olya B on 28.09.2023.
//

import SwiftUI

struct RepliesBar: View {
    var body: some View {
        Text("You have no replies yet".localized)
            .foregroundColor(Color(.systemGray))
    }
}

struct RepliesBar_Previews: PreviewProvider {
    static var previews: some View {
        RepliesBar()
    }
}
