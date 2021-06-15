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
                PlayerListView()
                .tabItem {
                    Label("Players", systemImage: "person.3")
                        .foregroundColor(Color.theme.accent)
                }
                .tag(1)
                
                Text("Livescores")
                .tabItem {
                    Label("Live", systemImage: "sportscourt")
                        .foregroundColor(Color.theme.accent)
                }
                .tag(1)
            }
        }
    }
}
