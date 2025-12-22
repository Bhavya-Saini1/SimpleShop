//
//  RootTabView.swift
//  SimpleShop
//
//  Created by Parth Narkhede on 2025-12-22.
//

import SwiftUI

struct RootTabView: View {
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Label("Home", systemImage: "house")
                }
            
            CartView()
                .tabItem {
                    Label("Cart", systemImage: "cart")
                }
            SearchView()
                .tabItem {
                    Label("Search", systemImage: "magnifyingglass")
                }
        }
    }
}
