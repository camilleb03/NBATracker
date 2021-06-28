//
//  TeamProgressBarStatView.swift
//  NBATracker
//
//  Created by Camille Bourbonnais on 2021-06-27.
//

import SwiftUI

struct TeamProgressBarStatView: View {
    
    let stat: GameStatistic<(Int, Int)>
    
    var body: some View {
        VStack(spacing: 0) {
            HStack {
                Text("\(stat.value.0)")
                
                Spacer()
                
                Text(stat.title)
                
                Spacer()
                
                Text("\(stat.value.1)")
            }
            .font(.subheadline)
            
            ProgressBarView(value: .constant(calculatePercentage(with: stat.value.0, and: stat.value.1)))
                .frame(height: 7)
        }
    }
    
    private func calculatePercentage(with value1: Int, and value2: Int) -> Double {
        let numerator = Double(value1)
        let denominator = Double(value1 + value2)
        let result = numerator / denominator
        return result
    }
}

struct TeamProgressBarStatView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            TeamProgressBarStatView(stat: dev.allTeamStats1.randomElement() ?? GameStatistic(title: "Points", value: (110, 98)))
                .padding(4)
                .preferredColorScheme(.light)
                .previewLayout(.sizeThatFits)
            
            TeamProgressBarStatView(stat: dev.allTeamStats1.randomElement() ?? GameStatistic(title: "Points", value: (110, 98)))
                .padding(4)
                .preferredColorScheme(.dark)
                .previewLayout(.sizeThatFits)
        }
    }
}
