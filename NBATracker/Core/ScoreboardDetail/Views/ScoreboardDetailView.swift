//
//  ScoreboardDetailView.swift
//  NBATracker
//
//  Created by Camille Bourbonnais on 2021-06-21.
//

import SwiftUI

struct ScoreboardDetailLoadingView: View {
    
    @Binding var scoreboard: Scoreboard?
    
    var body: some View {
        ZStack {
            if let scoreboard = scoreboard {
                ScoreboardDetailView(scoreboard: scoreboard)
            }
        }
    }
}


struct ScoreboardDetailView: View {
    
    @StateObject private var vm: ScoreboardDetailViewModel
    
    let scoreboard: Scoreboard
    
    init(scoreboard: Scoreboard) {
        _vm = StateObject(wrappedValue: ScoreboardDetailViewModel(scoreboard: scoreboard))
        self.scoreboard = scoreboard
    }
    
    var body: some View {
        ZStack {
            // background
            Color.theme.background
                .ignoresSafeArea()
            
            // content
            VStack(spacing: 0) {
                GameInfoView(scoreboard: scoreboard)
                    .padding()
                
                GameScoreTableView(scoreboard: scoreboard)
                    .padding(.horizontal)
                
                TabView {
                    ZStack {
                        Color(.systemRed)
                            .clipShape(RoundedRectangle(cornerRadius: 10.0))
                        
                        Text("Team Stats")
                    }
                    
                    ZStack {
                        Color(.systemTeal)
                            .clipShape(RoundedRectangle(cornerRadius: 10.0))
                        Text("Team Leaders")
                    }
                    
                    ZStack {
                        Color(.systemPurple)
                            .clipShape(RoundedRectangle(cornerRadius: 10.0))
                        Text("Play-by-play")
                    }
                    
                    ZStack {
                        Color(.systemIndigo)
                            .clipShape(RoundedRectangle(cornerRadius: 10.0))
                        Text("Game Flow")
                    }
                }
                
                .padding()
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
                .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
                
                Spacer()
            }
        }
        .navigationTitle(
            Text("\(scoreboard.visitorTeam.triCode) @ \(scoreboard.homeTeam.triCode)")
        )
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct ScoreboardDetailView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            TabView {
                NavigationView {
                    ScoreboardDetailView(scoreboard: dev.scoreboardNotStarted)
                        .preferredColorScheme(.light)
                }
            }
            
            TabView {
                NavigationView {
                    ScoreboardDetailView(scoreboard: dev.scoreboardIsHalftime)
                        .preferredColorScheme(.light)
                }
            }
            
            TabView {
                NavigationView {
                    ScoreboardDetailView(scoreboard: dev.scoreboardIsPlaying)
                        .preferredColorScheme(.dark)
                }
            }
            
            TabView {
                NavigationView {
                    ScoreboardDetailView(scoreboard: dev.scoreboardIsFinished)
                        .preferredColorScheme(.dark)
                }
            }
        }
    }
}

extension ScoreboardDetailView {
    
}
