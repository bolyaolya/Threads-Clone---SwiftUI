//
//  ContentView.swift
//  Threads
//
//  Created by Olya B on 17.09.2023.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = ContentViewModel()
    
    var body: some View {
        if viewModel.userSession != nil {
            ThreadsTabView()
        } else {
            FirstScreenView()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
