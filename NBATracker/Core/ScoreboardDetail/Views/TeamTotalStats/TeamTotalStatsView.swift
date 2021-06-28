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
                    VStack(spacing: 1) {
                        HStack {
                            // Visitor
                            HStack {
                                Text("\(stat.value.visitor.made)/\(stat.value.visitor.attempted)")
                                Text("(\(stat.value.visitor.percentage.convertDoubleToPercentString()))")
                                    .foregroundColor(Color.theme.secondaryText)
                            }
                            
                            Spacer()
                            
                            Text(stat.title)
                            
                            Spacer()
                            // Home
                            HStack {
                                Text("(\(stat.value.home.percentage.convertDoubleToPercentString()))")
                                    .foregroundColor(Color.theme.secondaryText)
                                Text("\(stat.value.home.made)/\(stat.value.home.attempted)")
                            }
                        }
                        .font(.subheadline)
                        
                        ProgressBarView(value: .constant(calculatePercentage(with: stat.value.visitor.percentage, and: stat.value.home.percentage)))
                            .frame(height: 7)
                    }
                    .padding(4)
                }
                ForEach(allTeamGeneralStats) { stat in
                    TeamProgressBarStatView(stat: stat)
                        .padding(4)
                }
            }
        }
    }
    
    private func calculatePercentage(with value1: Double, and value2: Double) -> Double {
        let numerator = value1
        let denominator = value1 + value2
        let result = numerator / denominator
        return result
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
