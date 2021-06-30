//
//  BarChartView.swift
//  NBATracker
//
//  Created by Camille Bourbonnais on 2021-06-28.
//

import SwiftUI

struct BarChartView: View {
    
    let visitorNumber: Int
    let homeNumber: Int
    
    var body: some View {
        
        HStack(spacing: 5) {
            BarChartCell(value: calculatePercentage(for: Double(visitorNumber), comparedTo: Double(homeNumber)), barColor: Color.theme.blue)
            BarChartCell(value: calculatePercentage(for: Double(homeNumber), comparedTo: Double(visitorNumber)), barColor: Color.theme.green)
        }
    }
    
    private func calculatePercentage(for number: Double, comparedTo: Double) -> Double {
        let max = max(number, comparedTo)
        guard max != 0 else { return 0 }
        return number / max
    }
}

struct BarChartView_Previews: PreviewProvider {
    static var previews: some View {
        BarChartView(visitorNumber: 14, homeNumber: 6)
    }
}

struct BarChartCell: View {
    
    var value: Double
    var barColor: Color
    
    var body: some View {
        RoundedRectangle(cornerRadius: 5.0)
            .fill(barColor)
            .scaleEffect(CGSize(width: 1, height: value), anchor: .bottom)
        
    }
}
