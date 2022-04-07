//
//  AppTabNavigation.swift
//  NewsAPITest
//
//  Created by ian schoenrock on 3/10/22.
//

import SwiftUI

struct AppTabNavigation: View {
    @State private var tabSelect: Tab = .one
    var body: some View {
        HStack{
        TabView(selection: $tabSelect){
            NavigationView{
                HomePageView()
            }.tabItem{Label("Top Headlines" , systemImage: "globe")}.tag(Tab.one)
            
            NavigationView{
                SearchView()
            }.tabItem{Label("Search" , systemImage: "magnifyingglass")}.tag(Tab.two)
            
            NavigationView{
                SettingsView()
            }.tabItem{Label("Settings" , systemImage: "gearshape")}.tag(Tab.three)
                
        }
    }
    }
    enum Tab{
        case one
        case two
        case three
    }
}
