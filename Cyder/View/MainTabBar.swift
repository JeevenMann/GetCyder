//
//  TabBar.swift
//  Cyder
//
//  Created by Navjeeven Mann on 2023-03-17.
//

import SwiftUI

struct MainTabBar: View {
    
    @State var selection = 0
    
    var body: some View {
        TabView(selection: $selection) {
            
            HomeView(selection: $selection)
                .tabItem {
                    Label("Home", systemImage: "house.fill")
                }
                .tag(0)
            
            DashboardView()
                .tabItem {
                    Label("Tasks", systemImage: "list.bullet.clipboard.fill")
                }
                .tag(1)
            
            OffersView()
                .tabItem {
                    Label("Rewards", systemImage: "tag.fill")
                }
                .tag(2)
            
            SettingView()
                .tabItem {
                    Label("Data Control", systemImage: "lock.fill")
                }
                .tag(3)
            
            
        }
    }
}

struct MainTabBar_Previews: PreviewProvider {
    static var previews: some View {
        MainTabBar()
    }
}
