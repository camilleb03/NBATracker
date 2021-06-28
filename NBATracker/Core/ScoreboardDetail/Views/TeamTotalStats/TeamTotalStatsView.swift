//
//  TeamTotalStatsView.swift
//  NBATracker
//
//  Created by Camille Bourbonnais on 2021-06-27.
//

import SwiftUI

struct TeamTotalStatsView: View {
    
    @Binding var allTeamGeneralStats: [GameStatistic<(Int, Int)>]
    @Binding var allTeamShootingStats: [GameStatistic<(home: (made: Int, attempted: Int, percentage: Double), visitor: (made: Int, attempted: Int, percentage: Double))>]
    
    var body: some View {
        if allTeamGeneralStats.isEmpty {
            Text("No data available")
            
        } else {
            ScrollView(showsIndicators: false) {
                
                ForEach(allTeamShootingStats) { stat in
                    TeamShootingStatBarView(stat: stat)
                    .padding(4)
                }
                
                ForEach(allTeamGeneralStats) { stat in
                    TeamGeneralStatBarView(stat: stat)
                    .padding(4)
                }
            }
        }
    }
}

struct TeamTotalStatsView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            TeamTotalStatsView(allTeamGeneralStats: .constant(dev.allTeamGeneralStats1),
                               allTeamShootingStats: .constant(dev.allTeamShootingStats1))
                .preferredColorScheme(.light)
                .previewLayout(.sizeThatFits)
            
            TeamTotalStatsView(allTeamGeneralStats: .constant(dev.allTeamGeneralStats1),
                               allTeamShootingStats: .constant(dev.allTeamShootingStats1))
                .preferredColorScheme(.dark)
                .previewLayout(.sizeThatFits)
        }
    }
}
