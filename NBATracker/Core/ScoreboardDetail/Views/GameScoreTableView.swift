//
//  GameScoreTableView.swift
//  NBATracker
//
//  Created by Camille Bourbonnais on 2021-06-26.
//

import SwiftUI

struct GameScoreTableView: View {
    
    let scoreboard: Scoreboard
    
    var body: some View {
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
    }
}

struct GameScoreTableView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            GameScoreTableView(scoreboard: dev.scoreboardNotStarted)
                .padding()
                .preferredColorScheme(.light)
                .previewLayout(.sizeThatFits)
            
            GameScoreTableView(scoreboard: dev.scoreboardIsHalftime)
                .padding()
                .preferredColorScheme(.dark)
                .previewLayout(.sizeThatFits)
            
            GameScoreTableView(scoreboard: dev.scoreboardIsPlaying)
                .padding()
                .preferredColorScheme(.light)
                .previewLayout(.sizeThatFits)
            
            GameScoreTableView(scoreboard: dev.scoreboardIsFinished)
                .padding()
                .preferredColorScheme(.dark)
                .previewLayout(.sizeThatFits)
        }
    }
}
