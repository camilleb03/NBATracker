//
//  TeamTotalStatsView.swift
//  NBATracker
//
//  Created by Camille Bourbonnais on 2021-06-27.
//

import SwiftUI

struct TeamTotalStatsView: View {
    
    @Binding var allTeamStats: [GameStatistic<(Int, Int)>]
    
    var body: some View {
        if allTeamStats.isEmpty {
            Text("No data available")
            
        } else {
            ScrollView(showsIndicators: false) {
                ForEach(allTeamStats) { stat in
                    TeamProgressBarStatView(stat: stat)
                        .padding(4)
                }
            }
        }
    }
}

struct TeamTotalStatsView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            TeamTotalStatsView(allTeamStats: .constant(dev.allTeamStats1))
                .preferredColorScheme(.light)
                .previewLayout(.sizeThatFits)
            
            TeamTotalStatsView(allTeamStats: .constant(dev.allTeamStats1))
                .preferredColorScheme(.dark)
                .previewLayout(.sizeThatFits)
        }
    }
}
