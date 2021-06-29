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
        Text("Hello World")
            .onAppear() {
                print(allTeamLeadersStats)
            }
    }
}

struct TeamLeadersView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            TeamLeadersView(allTeamLeadersStats: .constant(dev.allTeamLeadersStats1))
                .preferredColorScheme(.light)
                .previewLayout(.sizeThatFits)
            
            TeamLeadersView(allTeamLeadersStats: .constant(dev.allTeamLeadersStats1))
                .preferredColorScheme(.dark)
                .previewLayout(.sizeThatFits)
            
            TeamLeadersView(allTeamLeadersStats: .constant(dev.allTeamLeadersStatsEmpty))
                .preferredColorScheme(.light)
                .previewLayout(.sizeThatFits)
        }
    }
}
