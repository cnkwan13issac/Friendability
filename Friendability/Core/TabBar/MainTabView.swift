//
//  MainTabView.swift
//  Friendability
//
//  Created by Kwan Ching Nam on 23/11/2023.
//

import SwiftUI

struct MainTabView: View {
    let user: User
    @State private var selectedIndex = 0
    
    var body: some View {
        TabView (selection: $selectedIndex) {
            FeedView()
                .onAppear {
                    selectedIndex = 0
                }
                .tabItem {
                    Image(systemName: "house")
                }.tag(0)
            
            SearchView()
                .onAppear {
                    selectedIndex = 1
                }
                .tabItem {
                    Image(systemName: "magnifyingglass")
                }.tag(1)
            
            UploadPostView(tabIndex: $selectedIndex)
                .onAppear {
                    selectedIndex = 2
                }
                .tabItem {
                    Image(systemName: "plus.square")
                }.tag(2)
            
            Text("Chat")
                .onAppear {
                    selectedIndex = 3
                }
                .tabItem {
                    Image(systemName: "message")
                }.tag(3)
            
            Text("Interest Groups")
                .onAppear {
                    selectedIndex = 4
                }
                .tabItem {
                    Image(systemName: "gamecontroller.fill")
                }.tag(4)
            
            CurrentUserProfileView(user: user)
                .onAppear {
                    selectedIndex = 5
                }
                .tabItem {
                    Image(systemName: "person")
                }.tag(5)
            
            
        }
        .accentColor(.black)
    }
}

#Preview {
    MainTabView(user: User.MOCK_USERS[0])
}
