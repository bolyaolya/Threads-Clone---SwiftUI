//
//  ExploreView.swift
//  Threads
//
//  Created by Olya B on 17.09.2023.
//

import SwiftUI

struct ExploreView: View {
    @State private var searchText = ""
    @StateObject var viewModel = ExploreViewModel()
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVStack {
                    ForEach(viewModel.filteredUsers) { user in
                        NavigationLink(value: user) {
                            VStack {
                                UserCell(user: user)
                                
                                Divider()
                            }
                            .padding(.vertical, 4)
                        }
                    }
                }
            }
            .navigationDestination(for: User.self, destination: { user in
                ProfileView(user: user)
            })
            .navigationTitle("Search".localized)
            .searchable(text: $searchText, prompt: "Search")
            .onChange(of: searchText) { _ in
                filterUsers()
            }
        }
        .tint(Color("black"))
    }
    
    func filterUsers() {
        if searchText.isEmpty {
            viewModel.filteredUsers = viewModel.users
        } else {
            viewModel.filteredUsers = viewModel.users.filter {
                $0.username
                    .localizedCaseInsensitiveContains(searchText)
            }
        }
    }
}

struct ExploreView_Previews: PreviewProvider {
    static var previews: some View {
        ExploreView()
    }
}
