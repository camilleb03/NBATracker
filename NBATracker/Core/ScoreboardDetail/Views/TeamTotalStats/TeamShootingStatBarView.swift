//
//  TeamShootingStatBarView.swift
//  NBATracker
//
//  Created by Camille Bourbonnais on 2021-06-28.
//

import SwiftUI

struct TeamShootingStatBarView: View {
    let stat: GameStatistic<(home: (made: Int, attempted: Int, percentage: Double),
                             visitor: (made: Int, attempted: Int, percentage: Double))>
    
    var body: some View {
        VStack(spacing: 0) {
            HStack {
                // Visitor
                HStack(spacing: 5) {
                    Text("\(stat.value.visitor.made)/\(stat.value.visitor.attempted)")
                    Text("(\(stat.value.visitor.percentage.convertDoubleToPercentString()))")
                        .foregroundColor(Color.theme.secondaryText)
                }
                
                Spacer()
                
                Text(stat.title)
                
                Spacer()
                
                // Home
                HStack(spacing: 5) {
                    Text("(\(stat.value.home.percentage.convertDoubleToPercentString()))")
                        .foregroundColor(Color.theme.secondaryText)
                    Text("\(stat.value.home.made)/\(stat.value.home.attempted)")
                }
            }
            .font(.subheadline)
            
            ProgressBarView(value: .constant(calculatePercentage(with: stat.value.visitor.percentage, and: stat.value.home.percentage)))
                .frame(height: 7)
        }
    }
    
    private func calculatePercentage(with value1: Double, and value2: Double) -> Double {
        let numerator = value1
        let denominator = value1 + value2
        if denominator.isZero {
            return 0.5
        }
        return (numerator / denominator)
    }
}

struct TeamShootingStatBarView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            TeamShootingStatBarView(
                stat: dev.allTeamShootingStats1.randomElement() ??
                    GameStatistic<(home: (made: Int, attempted: Int, percentage: Double), visitor: (made: Int, attempted: Int, percentage: Double))>(title: "Field Goals", value: (home: (made: 39, attempted: 84, percentage: 0.46399999999999997), visitor: (made: 45, attempted: 88, percentage: 0.511))))
                .padding(4)
                .preferredColorScheme(.light)
                .previewLayout(.sizeThatFits)
            
            TeamShootingStatBarView(
                stat: dev.allTeamShootingStats1.randomElement() ??
                    GameStatistic<(home: (made: Int, attempted: Int, percentage: Double), visitor: (made: Int, attempted: Int, percentage: Double))>(title: "Field Goals", value: (home: (made: 39, attempted: 84, percentage: 0.46399999999999997), visitor: (made: 45, attempted: 88, percentage: 0.511))))
                .padding(4)
                .preferredColorScheme(.dark)
                .previewLayout(.sizeThatFits)
        }
    }
}
