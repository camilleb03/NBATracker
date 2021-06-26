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
            boxscoreSection
        }
    }
}

struct ScoreboardDetailView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ScoreboardDetailView(scoreboard: dev.scoreboardNotStarted)
                .preferredColorScheme(.light)
            
            ScoreboardDetailView(scoreboard: dev.scoreboardIsHalftime)
                .preferredColorScheme(.light)
            
            ScoreboardDetailView(scoreboard: dev.scoreboardIsPlaying)
                .preferredColorScheme(.dark)
        }
    }
}

extension ScoreboardDetailView {
    
    private var boxscoreSection: some View {
        HStack(spacing: 0) {
            GameColumnView(
                columnTitle: "Team",
                homeRow: scoreboard.homeTeam.triCode,
                visitorRow: scoreboard.visitorTeam.triCode, isCurrentPeriod: false)
            
            ForEach(0..<scoreboard.periodNames.count) { index in
                GameColumnView(
                    columnTitle: scoreboard.periodNames[index],
                    homeRow: scoreboard.homeTeam.linescore[index],
                    visitorRow: scoreboard.visitorTeam.linescore[index], isCurrentPeriod: (scoreboard.gameStatus == .isPlaying && scoreboard.currentPeriod == index + 1))
            }
            
            GameColumnView(
                columnTitle: "Score",
                homeRow: scoreboard.homeTeam.score,
                visitorRow: scoreboard.visitorTeam.score, isCurrentPeriod: false)
        }
        .clipShape(
            RoundedRectangle(cornerRadius: 10.0)
        )
        .background(
            RoundedRectangle(cornerRadius: 10.0)
                .strokeBorder(Color.theme.secondaryBackground, lineWidth: 2)
        )
        .padding()
    }
}
