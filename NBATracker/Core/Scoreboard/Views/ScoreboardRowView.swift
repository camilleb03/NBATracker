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
        HStack{
            
            TeamRecord(team: scoreboard.homeTeam)
            
            HStack(spacing: 0) {
                Spacer()
                homeTeamScore
                Spacer()
                gameStatus
                Spacer()
                visitorTeamScore
                Spacer()
            }
            .frame(maxWidth: .infinity)
            .foregroundColor(
                (scoreboard.gameStatus == .isFinished) ? Color.theme.secondaryText : (scoreboard.gameStatus == .isPlaying) ? Color.theme.green : (scoreboard.gameStatus == .isNotStarted) ? nil : Color.theme.red
            )
            
            TeamRecord(team: scoreboard.visitorTeam)
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

struct TeamRecord: View {
    
    let team: Scoreboard.SBTeam
    
    var body: some View {
        VStack(spacing: 0) {
            TeamImageView(teamTricode: team.triCode)
                .frame(width: 50, height: 50)
            Text("\(team.win) - \(team.loss)")
                .foregroundColor(Color.theme.secondaryText)
        }
    }
}

extension ScoreboardRowView {
    
    private var homeTeamScore: some View {
        Text(scoreboard.homeTeam.score.isEmpty ? "-" : scoreboard.homeTeam.score)
            .font(.title)
            .bold()
    }
    
    private var gameStatus: some View {
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
