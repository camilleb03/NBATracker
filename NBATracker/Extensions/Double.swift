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
    
    private static let statFormatter1: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.minimumFractionDigits = 0
        formatter.maximumFractionDigits = 1
        return formatter
    }()
    
    func convertStatToString() -> String {
        let number = NSNumber(value: self)
        return Double.statFormatter1.string(from: number) ?? "N/A"
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
