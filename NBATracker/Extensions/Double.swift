//
//  Double.swift
//  NBATracker
//
//  Created by Camille Bourbonnais on 2021-06-27.
//

import Foundation

extension Double {
    
    private static let percentageFormatter1: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .percent
        formatter.minimumFractionDigits = 0
        formatter.maximumFractionDigits = 0
        return formatter
    }()
    
    func convertDoubleToPercentString() -> String {
        let number = NSNumber(value: self)
        return Double.percentageFormatter1.string(from: number) ?? "N/A"
    }
    
    private static let gameStatFormatter1: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.minimumFractionDigits = 0
        formatter.maximumFractionDigits = 1
        return formatter
    }()
    
    private static let winPercentageFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.minimumFractionDigits = 3
        formatter.maximumFractionDigits = 3
        return formatter
    }()
    
    func convertStatToString() -> String {
        let number = NSNumber(value: self)
        return Double.gameStatFormatter1.string(from: number) ?? "N/A"
    }
    
    func convertWinPercentageToString() -> String {
        let number = NSNumber(value: self)
        return Double.winPercentageFormatter.string(from: number) ?? "N/A"
    }
    
    private static let metricFormatter2: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.minimumFractionDigits = 0
        formatter.maximumFractionDigits = 2
        return formatter
    }()
    
    func convertMetricToString() -> String {
        let number = NSNumber(value: self)
        return Double.metricFormatter2.string(from: number) ?? "N/A"
    }
}
