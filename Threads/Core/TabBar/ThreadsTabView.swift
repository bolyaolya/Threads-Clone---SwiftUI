//
//  ThreadsTabView.swift
//  Threads
//
//  Created by Olya B on 17.09.2023.
//

import SwiftUI

struct ThreadsTabView: View {
    @State private var selectedTab = 0
    @State private var showCreatThreadView = false
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        TabView(selection: $selectedTab) {
            FeedView()
                .tabItem {
                    if selectedTab == 0 {
                        Image(systemName: "house.fill")
                            .renderingMode(.template)
                            .environment(\.symbolVariants, .fill)
                            .foregroundColor(colorScheme == .dark ? Color.white : Color.black)
                    } else {
                        Image(systemName: "house")
                            .renderingMode(.template)
                            .environment(\.symbolVariants, .none)
                            .foregroundColor(colorScheme == .dark ? Color.white : Color.black)
                    }
            }
                .onAppear { selectedTab = 0 }
                .tag(0)
            
            //                .tabItem {
            //                    Image(systemName: selectedTab == 0 ? "house.fill" : "house")
            //                        .environment(\.symbolVariants, selectedTab == 0 ? .fill : .none)
            //                        .foregroundColor(colorScheme == .dark ? Color.white : Color.black)
            //                }
            
            ExploreView()
                .tabItem {
                    Image(systemName: "magnifyingglass")
                }
                .onAppear { selectedTab = 1 }
                .tag(1)
            
            Text("")
                .tabItem {
                    Image(systemName: "plus")
                }
                .onAppear { selectedTab = 2 }
                .tag(2)
            
            ActivityView()
                .tabItem {
                    Image(systemName: selectedTab == 3 ? "heart.fill" : "heart")
                        .environment(\.symbolVariants, selectedTab == 3 ? .fill : .none)
                }
                .onAppear { selectedTab = 3 }
                .tag(3)
            
            CurrentUserProfileView()
                .tabItem {
                    Image(systemName: selectedTab == 4 ? "person.fill" : "person")
                        .environment(\.symbolVariants, selectedTab == 4 ? .fill : .none)
                }
                .onAppear { selectedTab = 4 }
                .tag(4)
        }
        
        .onChange(of: selectedTab, perform: { newValue in
            showCreatThreadView = selectedTab == 2
        })
        .sheet(isPresented: $showCreatThreadView, onDismiss: {
            selectedTab = 0
        }, content: {
            CreateThreadView()
        })
        
        .tint(.black)
    }
}

struct ThreadsTabView_Previews: PreviewProvider {
    static var previews: some View {
        ThreadsTabView()
    }
}
