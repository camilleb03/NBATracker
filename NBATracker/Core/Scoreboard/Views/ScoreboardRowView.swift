//
//  ScoreboardRowView.swift
//  NBATracker
//
//  Created by Camille Bourbonnais on 2021-06-16.
//

import SwiftUI

struct ScoreboardRowView: View {
    
    let scoreboard: Scoreboard
    
    var body: some View {
        HStack {
            TeamRecordView(team: scoreboard.visitorTeam)
            
            gameInfo
            
            TeamRecordView(team: scoreboard.homeTeam)
        }
        .frame(maxWidth: .infinity)
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 10.0)
                .fill(Color.theme.background)
                .shadow(color: Color.theme.accent.opacity(0.30),
                        radius: 10, x: 0.0, y: 0.0)
        )
        .padding()
    }
}

struct ScoreboardRowView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ScoreboardRowView(scoreboard: dev.scoreboardNotStarted)
                .previewLayout(.sizeThatFits)
                .preferredColorScheme(.light)
            
            ScoreboardRowView(scoreboard: dev.scoreboardNotStarted)
                .previewLayout(.sizeThatFits)
                .preferredColorScheme(.dark)
            
            ScoreboardRowView(scoreboard: dev.scoreboardIsPlaying)
                .previewLayout(.sizeThatFits)
                .preferredColorScheme(.dark)
            
            ScoreboardRowView(scoreboard: dev.scoreboardIsPlaying)
                .previewLayout(.sizeThatFits)
                .preferredColorScheme(.light)
            
            ScoreboardRowView(scoreboard: dev.scoreboardIsHalftime)
                .previewLayout(.sizeThatFits)
                .preferredColorScheme(.dark)
            
            ScoreboardRowView(scoreboard: dev.scoreboardIsEndOfPeriod)
                .previewLayout(.sizeThatFits)
                .preferredColorScheme(.light)
            
            ScoreboardRowView(scoreboard: dev.scoreboardIsFinished)
                .previewLayout(.sizeThatFits)
                .preferredColorScheme(.light)
            
            ScoreboardRowView(scoreboard: dev.scoreboardIsFinished)
                .previewLayout(.sizeThatFits)
                .preferredColorScheme(.dark)
        }
    }
}

struct TeamRecordView: View {
    
    let team: SBTeam
    
    var body: some View {
        VStack(spacing: 0) {
            TeamImageView(teamTricode: team.triCode, logoType: .secondary)
                .frame(width: 50, height: 50)
            Text("\(team.win) - \(team.loss)")
                .foregroundColor(Color.theme.secondaryText)
        }
    }
}

extension ScoreboardRowView {
    
    private var gameInfo: some View {
        VStack(spacing: 0) {
            HStack(spacing: 0) {
                Spacer(minLength: 5)
                visitorTeamScore
                Spacer(minLength: 5)
                timeStatus
                Spacer(minLength: 5)
                homeTeamScore
                Spacer(minLength: 5)
            }
            .frame(maxWidth: .infinity)
            .frame(height: 50)
            .foregroundColor(
                (scoreboard.gameStatus == .isFinished) ? Color.theme.secondaryText : (scoreboard.gameStatus == .isPlaying) ? Color.theme.green : (scoreboard.gameStatus == .isNotStarted) ? nil : Color.theme.red
            )
            Text("\(scoreboard.visitorTeam.triCode) @ \(scoreboard.homeTeam.triCode)")
                .font(.subheadline)
                .foregroundColor(Color.theme.secondaryText)
        }
    }
    
    private var homeTeamScore: some View {
        Text(scoreboard.homeTeam.score.isEmpty ? "-" : scoreboard.homeTeam.score)
            .font(.title)
            .bold()
    }
    
    private var timeStatus: some View {
        Text(scoreboard.getGameInfoString())
            .font(.headline)
            .fontWeight(.semibold)
    }
    
    private var visitorTeamScore: some View {
        Text(scoreboard.visitorTeam.score.isEmpty ? "-" : scoreboard.visitorTeam.score)
            .font(.title)
            .bold()
    }
}
