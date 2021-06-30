//
//  TeamLeadersView.swift
//  NBATracker
//
//  Created by Camille Bourbonnais on 2021-06-28.
//

import SwiftUI

struct TeamLeadersView: View {
    
    @Binding var allTeamLeadersStats: [GameStatistic<(home: StatLeader, visitor: StatLeader)>]
    
    var body: some View {
        if allTeamLeadersStats.isEmpty {
            Text("No data available")
            
        } else {
            ScrollView(showsIndicators: false) {
                ForEach(allTeamLeadersStats) { leaderStat in
                    TeamLeaderStatView(leaderStat: leaderStat)
                        .padding(2)
                }
            }
        }
    }
}

struct TeamLeadersView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            TeamLeadersView(allTeamLeadersStats: .constant(dev.allTeamLeadersStats1))
                .padding()
                .preferredColorScheme(.light)
                .previewLayout(.sizeThatFits)
            
            TeamLeadersView(allTeamLeadersStats: .constant(dev.allTeamLeadersStats1))
                .padding()
                .preferredColorScheme(.dark)
                .previewLayout(.sizeThatFits)
            
            TeamLeadersView(allTeamLeadersStats: .constant(dev.allTeamLeadersStatsEmpty))
                .padding()
                .preferredColorScheme(.light)
                .previewLayout(.sizeThatFits)
        }
    }
}
