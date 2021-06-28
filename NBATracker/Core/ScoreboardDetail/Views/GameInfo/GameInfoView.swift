//
//  GameInfoView.swift
//  NBATracker
//
//  Created by Camille Bourbonnais on 2021-06-26.
//

import SwiftUI

struct GameInfoView: View {
    
    let scoreboard: Scoreboard
    
    var body: some View {
        VStack {
            HStack(alignment: .bottom) {
                Spacer()
                
                // Visitor side
                TeamInfoView(team: scoreboard.visitorTeam, isHome: false)
                
                // Game info
                VStack {
                    Text(scoreboard.startTimeDate.convertDateToLocalDateMediumString() + "\n" + scoreboard.startTimeDate.convertDateToLocalTimeShortString())
                        .font(.footnote)
                        .multilineTextAlignment(.center)
                    
                    Text(scoreboard.arenaInfo.name + "\n" + scoreboard.arenaInfo.city)
                        .font(.footnote)
                        .foregroundColor(Color.theme.secondaryText)
                        .multilineTextAlignment(.center)
                                        
                    timeStatus
                        .padding(.top)
                }
                .frame(maxWidth: .infinity)
                
                // Home side
                TeamInfoView(team: scoreboard.homeTeam, isHome: true)
                
                Spacer()
            }
        }
    }
}

struct GameInfoView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            GameInfoView(scoreboard: dev.scoreboardNotStarted)
                .padding()
                .preferredColorScheme(.light)
                .previewLayout(.sizeThatFits)
            
            GameInfoView(scoreboard: dev.scoreboardIsEndOfPeriod)
                .padding()
                .preferredColorScheme(.dark)
                .previewLayout(.sizeThatFits)
            
            GameInfoView(scoreboard: dev.scoreboardIsHalftime)
                .padding()
                .preferredColorScheme(.dark)
                .previewLayout(.sizeThatFits)
            
            GameInfoView(scoreboard: dev.scoreboardIsPlaying)
                .padding()
                .preferredColorScheme(.light)
                .previewLayout(.sizeThatFits)
            
            GameInfoView(scoreboard: dev.scoreboardIsFinished)
                .padding()
                .preferredColorScheme(.dark)
                .previewLayout(.sizeThatFits)
        }
    }
}

struct TeamInfoView: View {
    
    let team: SBTeam
    let isHome: Bool
    
    var body: some View {
        VStack(spacing: 5) {
            HStack(spacing: 5) {
                Text(team.triCode)
                    .fontWeight(.semibold)
                Text("\(team.win)-\(team.loss)")
            }
            .font(.callout)
            
            TeamImageView(teamTricode: team.triCode, logoType: .primary)
                .frame(width: 60, height: 60)
                .padding(4)
                .background(
                    RoundedRectangle(cornerRadius: 10.0)
                        .fill(isHome ? Color.theme.green : Color.theme.blue)
                        //.strokeBorder(isHome ? Color.theme.green : Color.theme.blue, lineWidth: 2.0)
                )
            
            Text(isHome ? "Home" : "Visitor")
                .font(.caption)
            
            Text(team.score.isEmpty ? "-" : team.score)
                .font(.largeTitle)
                .fontWeight(.semibold)
        }
    }
}

extension GameInfoView {
    
    private var timeStatus: some View {
        Text(scoreboard.getGameInfoString())
            .font(.largeTitle)
            .fontWeight(.light)
    }
}
