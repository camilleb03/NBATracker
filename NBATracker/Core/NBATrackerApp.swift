//
//  NBATrackerApp.swift
//  NBATracker
//
//  Created by Camille Bourbonnais on 2021-06-13.
//

import SwiftUI

@main
struct NBATrackerApp: App {
    
    @State private var showLaunchView: Bool = true
    @State private var selection = 1
    
    var body: some Scene {
        WindowGroup {
            ZStack {
                TabView(selection: $selection) {
                    
                    Text("League Standings")
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
                    
                    SearchLeagueView()
                    .tabItem {
                        Label("Search", systemImage: "magnifyingglass")
                            .foregroundColor(Color.theme.accent)
                    }
                    .tag(2)
                }
                
                ZStack {
                    if showLaunchView {
                        LaunchView(showLaunchView: $showLaunchView)
                            .transition(.move(edge: .leading))
                    }
                }
                .zIndex(2.0)
            }
        }
    }
}
