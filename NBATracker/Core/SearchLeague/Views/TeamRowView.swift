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
            TeamImageView(teamTricode: team.tricode, logoType: .primary)
                .frame(width: 75, height: 75)
                .padding(4)
                .background(
                    RoundedRectangle(cornerRadius: 10.0)
                        .fill(Color.theme.secondaryBackgroundImage)
                )
             
            Spacer()
            
            VStack {
                Text(team.fullName)
                    .font(.headline)
                    .fontWeight(.bold)
                
                Text("\(team.conferenceName) - \(team.divisionName)")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundColor(Color.theme.secondaryText)
            }
            
            Spacer()
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
