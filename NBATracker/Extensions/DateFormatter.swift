//
//  DateFormatter.swift
//  NBATracker
//
//  Created by Camille Bourbonnais on 2021-06-15.
//

import Foundation

extension Date {
    
    private static let localTimeShort: DateFormatter = {
        let formatter = DateFormatter()
        var localTimeZoneAbbreviation: String { return TimeZone.current.abbreviation() ?? "UTC" }
        formatter.locale = Locale.init(identifier: localTimeZoneAbbreviation)
        formatter.timeStyle = .short
        return formatter
    }()
    
    private static let yyyyMMdd: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyyMMdd"
        return formatter
    }()
    
    func convertDateToLocalTimeShortString() -> String {
        return Date.localTimeShort.string(from: self)
    }
    
    func convertDateToyyyyMMddString() -> String {
        return Date.yyyyMMdd.string(from: self)
    }
}
