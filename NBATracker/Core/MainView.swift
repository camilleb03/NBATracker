//
//  MainView.swift
//  NBATracker
//
//  Created by Camille Bourbonnais on 2021-07-09.
//

import SwiftUI

struct MainView: View {
    
    @State private var selection = 1
    
    var body: some View {
        TabView(selection: $selection) {
            
            ConfStandingsView()
            .tabItem {
                Label("Standings", systemImage: "list.number")
                    .foregroundColor(Color.theme.accent)
            }
            .tag(0)
            
            NavigationView {
                ScoreboardView()
            }
            .navigationViewStyle(StackNavigationViewStyle())
            .tabItem {
                Label("Games", systemImage: "sportscourt")
                    .foregroundColor(Color.theme.accent)
            }
            .tag(1)
            NavigationView {
                SearchLeagueView()
            }
            .navigationViewStyle(StackNavigationViewStyle())
            .tabItem {
                Label("Search", systemImage: "magnifyingglass")
                    .foregroundColor(Color.theme.accent)
            }
            .tag(2)
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
