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
                    .padding()
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
            NavigationView {
                ScoreboardDetailView(scoreboard: dev.scoreboardNotStarted)
                    .preferredColorScheme(.light)
            }
            
            NavigationView {
                ScoreboardDetailView(scoreboard: dev.scoreboardIsHalftime)
                    .preferredColorScheme(.light)
            }
            
            NavigationView {
                ScoreboardDetailView(scoreboard: dev.scoreboardIsPlaying)
                    .preferredColorScheme(.dark)
            }
            
            NavigationView {
                ScoreboardDetailView(scoreboard: dev.scoreboardIsFinished)
                    .preferredColorScheme(.dark)
            }
        }
    }
}

extension ScoreboardDetailView {
    
}
