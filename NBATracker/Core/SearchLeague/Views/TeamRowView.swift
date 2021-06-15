//
//  TeamRowView.swift
//  NBATracker
//
//  Created by Camille Bourbonnais on 2021-06-15.
//

import SwiftUI

struct TeamRowView: View {
    
    let team: Team
    
    var body: some View {
        HStack {
            TeamImageView(teamTricode: team.tricode)
                .frame(width: 75, height: 75)
            Text(team.fullName)
        }
    }
}

struct TeamRowView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            TeamRowView(team: dev.team1)
                .previewLayout(.sizeThatFits)
                .preferredColorScheme(.light)
            
            TeamRowView(team: dev.team2)
                .previewLayout(.sizeThatFits)
                .preferredColorScheme(.dark)
        }
    }
}
