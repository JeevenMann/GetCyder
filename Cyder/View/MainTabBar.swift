//
//  TabBar.swift
//  Cyder
//
//  Created by Navjeeven Mann on 2023-03-17.
//

import SwiftUI

struct MainTabBar: View {
    var body: some View {
        TabView {
            
            HomeView()
                .tabItem {
                    Label("Home", systemImage: "house.fill")
                }
            
            DashboardView()
                .tabItem {
                    Label("Dashboard", systemImage: "rectangle.3.group.fill")
                }
            
            
            
            SettingView()
                .tabItem {
                    Label("Settings", systemImage: "gear")
                }
            
            
        }
    }
}

struct MainTabBar_Previews: PreviewProvider {
    static var previews: some View {
        MainTabBar()
    }
}
