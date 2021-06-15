//
//  NBATrackerApp.swift
//  NBATracker
//
//  Created by Camille Bourbonnais on 2021-06-13.
//

import SwiftUI

@main
struct NBATrackerApp: App {
    var body: some Scene {
        WindowGroup {
            TabView {
                SearchLeagueView()
                .tabItem {
                    Label("Search", systemImage: "magnifyingglass")
                        .foregroundColor(Color.theme.accent)
                }
                .tag(0)
                
                ScoreboardView()
                .tabItem {
                    Label("Games", systemImage: "sportscourt")
                        .foregroundColor(Color.theme.accent)
                }
                .tag(1)
            }
        }
    }
}
