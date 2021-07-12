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
    
    private static let doubleFormatter1: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.minimumFractionDigits = 0
        formatter.maximumFractionDigits = 1
        return formatter
    }()
    
    func convertDoubleToString() -> String {
        let number = NSNumber(value: self)
        return Double.doubleFormatter1.string(from: number) ?? "N/A"
    }
}
