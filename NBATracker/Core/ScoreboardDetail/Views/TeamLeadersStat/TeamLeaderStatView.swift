//
//  TeamLeaderStatView.swift
//  NBATracker
//
//  Created by Camille Bourbonnais on 2021-06-29.
//

import SwiftUI

struct TeamLeaderStatView: View {
    
    let leaderStat: GameStatistic<(home: StatLeader, visitor: StatLeader)>
    
    var body: some View {
        VStack(spacing: 0) {
            HStack {
                
                if let visitorPlayer = leaderStat.value.visitor.player {
                    PlayerImageView(playerID: visitorPlayer.personId)
                        .frame(width: 75, height: 75)
                } else {
                    Image(systemName: "person")
                        .foregroundColor(Color.theme.secondaryText)
                        .frame(width: 75, height: 75)
                }
                
                statInfo
                
                if let homePlayer = leaderStat.value.home.player {
                    PlayerImageView(playerID: homePlayer.personId)
                        .frame(width: 75, height: 75)
                } else {
                    Image(systemName: "person")
                        .foregroundColor(Color.theme.secondaryText)
                        .frame(width: 75, height: 75)
                }
            }
            
            customDivider
            
            statFooter
        }
    }
}

struct TeamLeaderStatView_Previews: PreviewProvider {
    static var previews: some View {
        
        let leaderStat = dev.allTeamLeadersStats1.randomElement() ??
            GameStatistic<(home: StatLeader, visitor: StatLeader)>(
                title: "Assists",
                value: (
                    home: StatLeader(
                        number: 7,
                        player: Optional(BasePlayer(personId: "1628989", firstName: "Kevin", lastName: "Huerter"))),
                    visitor: StatLeader(
                        number: 12,
                        player: Optional(BasePlayer(personId: "201950", firstName: "Jrue", lastName: "Holiday")))
                ))
        Group {
            TeamLeaderStatView(leaderStat: leaderStat)
                .padding()
                .preferredColorScheme(.light)
                .previewLayout(.sizeThatFits)
            
            TeamLeaderStatView(leaderStat: leaderStat)
                .padding()
                .preferredColorScheme(.dark)
                .previewLayout(.sizeThatFits)
            
            TeamLeaderStatView(leaderStat: leaderStat)
                .padding()
                .preferredColorScheme(.light)
                .previewLayout(.sizeThatFits)
        }
    }
}

extension TeamLeaderStatView {
    
    private var statInfo: some View {
        HStack {
            Text("\(leaderStat.value.visitor.number)")
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(Color.theme.blue)
                .frame(maxWidth: .infinity)
            
            BarChartView(visitorNumber: leaderStat.value.visitor.number, homeNumber: leaderStat.value.home.number)
                .frame(width: 40, height: 75)
                .padding(.bottom, 4)
            
            Text("\(leaderStat.value.home.number)")
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(Color.theme.green)
                .frame(maxWidth: .infinity)
        }
    }
    
    private var customDivider: some View {
        HStack(spacing: 5) {
            Rectangle()
                .frame(maxWidth: .infinity)
                .frame(height: 3)
                .foregroundColor(Color.theme.blue)
                .cornerRadius(45.0)
            
            Rectangle()
                .frame(maxWidth: .infinity)
                .frame(height: 3)
                .foregroundColor(Color.theme.green)
                .cornerRadius(45.0)
        }
    }
    
    private var statFooter: some View {
        HStack {
            Text(leaderStat.value.visitor.player?.fullName ?? "N/A")
                .font(.caption)
                .fontWeight(.medium)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            Text(leaderStat.title)
                .font(.caption)
                .fontWeight(.semibold)
                .foregroundColor(Color.theme.secondaryText)
                .frame(maxWidth: .infinity)
            
            Spacer()
            
            Text(leaderStat.value.home.player?.fullName ?? "N/A")
                .font(.caption)
                .fontWeight(.medium)
                .frame(maxWidth: .infinity, alignment: .trailing)
        }
    }
}
