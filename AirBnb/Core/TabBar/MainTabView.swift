//
//  MainTabView.swift
//  AirBnb
//
//  Created by Sean Muniz on 2024-10-14.
//

import SwiftUI

struct MainTabView: View {
    var body: some View {
        TabView {
            
            // First one will be displayed. 
            ExploreView()
                .tabItem { Label ("Explorer", systemImage: "magnifyingglass") }
            
            WishlistView()
                .tabItem { Label ("Wishlists", systemImage: "heart") }
            
            ProfileView()
                .tabItem { Label ("Profile", systemImage: "person") }
            
        }
    }
}

#Preview {
    MainTabView()
}
