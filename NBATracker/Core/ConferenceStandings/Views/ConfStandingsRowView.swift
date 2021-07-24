//
//  ConfStandingsRowView.swift
//  NBATracker
//
//  Created by Camille Bourbonnais on 2021-07-23.
//

import SwiftUI

struct ConfStandingsRowView: View {
    
    let position: Int
    let team: TeamStandingInfo
    
    var body: some View {
        HStack {
            HStack {
                Text("\(position)")
                    .underline(team.clinchedPlayoffs, color: Color.theme.green)
                
                TeamImageView(teamTricode: team.teamTriCode, logoType: .secondary)
                    .frame(width: 25, height: 25)
                
                Text(team.teamName)
            }
            .font(.subheadline)
            .frame(maxWidth: .infinity, alignment: .leading)
                        
            HStack(spacing: 3) {
                Text("\(team.wins)")
                    .frame(maxWidth: .infinity)
                
                Text("\(team.losses)")
                    .frame(maxWidth: .infinity)
                
                Text(team.winPercentage.convertWinPercentageToString())
                    .frame(maxWidth: .infinity)
                
                Text(position != 1 ? team.gamesBehind.convertStatToString() : "-")
                    .frame(maxWidth: .infinity)
            }
            .font(.caption)
            .frame(maxWidth: .infinity, alignment: .trailing)
        }
    }
}

struct ConfStandingsRowView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ConfStandingsRowView(position: 1, team: dev.westTeamStandingInfoFirst)
                .previewLayout(.sizeThatFits)
                .preferredColorScheme(.light)
            
            ConfStandingsRowView(position: 15, team: dev.eastTeamStandingInfoLast)
                .previewLayout(.sizeThatFits)
                .preferredColorScheme(.dark)
        }
    }
}
