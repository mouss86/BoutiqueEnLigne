//
//  ContentView.swift
//  BoutiqueEnLigne
//
//  Created by Moussa Cherif on 2024-05-08.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            // bottom bar
            HomeView()
                .tabItem {
                    Image(systemName: "house")
                    Text("Home")
                }
                .toolbarBackground(.visible,for: .tabBar)
                .toolbarBackground(.ultraThinMaterial,for: .tabBar)
            SearchView()
                .tabItem {
                    Image(systemName: "magnifyingglass")
                    Text("Search")
                }
                .toolbarBackground(.visible, for: .tabBar)
                .toolbarBackground(.ultraThinMaterial, for: .tabBar)
            
            
          
            
            ProfileView()
                .tabItem {
                    Image(systemName: "person")
                    Text("Profile")
                }
                .toolbarBackground(.visible, for: .tabBar)
                .toolbarBackground(.ultraThinMaterial, for: .tabBar)
        }
    
        
        }
    }




#Preview {
    ContentView()
}


