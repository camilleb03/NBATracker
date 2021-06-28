//
//  TeamGeneralStatBarView.swift
//  NBATracker
//
//  Created by Camille Bourbonnais on 2021-06-27.
//

import SwiftUI

struct TeamGeneralStatBarView: View {
    
    let stat: GameStatistic<(Int, Int)>
    
    var body: some View {
        VStack(spacing: 0) {
            HStack {
                // Visitor
                Text("\(stat.value.1)")
                
                Spacer()
                
                Text(stat.title)
                
                Spacer()
                
                // Home
                Text("\(stat.value.0)")
            }
            .font(.subheadline)
            
            ProgressBarView(value: .constant(calculatePercentage(with: Double(stat.value.1), and: Double(stat.value.0))))
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

struct TeamGeneralStatBarView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            TeamGeneralStatBarView(stat: dev.allTeamGeneralStats1.randomElement() ?? GameStatistic(title: "Points", value: (110, 98)))
                .padding(4)
                .preferredColorScheme(.light)
                .previewLayout(.sizeThatFits)
            
            TeamGeneralStatBarView(stat: GameStatistic(title: "Points", value: (0, 0)))
                .padding(4)
                .preferredColorScheme(.dark)
                .previewLayout(.sizeThatFits)
        }
    }
}
