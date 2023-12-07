//
//  ProfileView.swift
//  Friendability
//
//  Created by Kwan Ching Nam on 23/11/2023.
//

import SwiftUI

struct ProfileView: View {
    let user: User
    
    var body: some View {
        //        NavigationStack {
        ScrollView {
            // header
            ProfileHeaderView(user: user)
            
            // post grid view
            PostGridView(user: user)
        }
        .navigationTitle("Profile")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    ProfileView(user: User.MOCK_USERS[1])
}



