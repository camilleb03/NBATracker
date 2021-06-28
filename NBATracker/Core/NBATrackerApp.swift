//
//  NBATrackerApp.swift
//  NBATracker
//
//  Created by Camille Bourbonnais on 2021-06-13.
//

import SwiftUI

@main
struct NBATrackerApp: App {
    
    @State var showLaunchView: Bool = true
    
    var body: some Scene {
        WindowGroup {
            ZStack {
                TabView {
                    NavigationView {
                        ScoreboardView()
                    }
                    .tabItem {
                        Label("Games", systemImage: "sportscourt")
                            .foregroundColor(Color.theme.accent)
                    }
                    .tag(0)
                    
                    SearchLeagueView()
                    .tabItem {
                        Label("Search", systemImage: "magnifyingglass")
                            .foregroundColor(Color.theme.accent)
                    }
                    .tag(1)
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
