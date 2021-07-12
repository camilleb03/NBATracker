//
//  Date.swift
//  NBATracker
//
//  Created by Camille Bourbonnais on 2021-06-15.
//

import Foundation

extension Date {
    
    // "2021-03-13T20:49:26.606Z"
    init(gameDateString: String) {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"
        formatter.timeZone = TimeZone(abbreviation: "UTC")
        let date = formatter.date(from: gameDateString) ?? Date()
        self.init(timeInterval: 0, since: date)
    }
    
    // "1996-10-30"
    init(birthDateString: String) {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        formatter.timeZone = TimeZone(abbreviation: "UTC")
        let date = formatter.date(from: birthDateString) ?? Date()
        self.init(timeInterval: 0, since: date)
    }
    
    private static let localTimeShort: DateFormatter = {
        let formatter = DateFormatter()
        var localTimeZoneAbbreviation: String { return TimeZone.current.abbreviation() ?? "UTC" }
        formatter.timeZone = TimeZone.current
        formatter.locale = Locale.init(identifier: localTimeZoneAbbreviation)
        formatter.timeStyle = .short
        return formatter
    }()
    
    private static let localDateMedium: DateFormatter = {
        let formatter = DateFormatter()
        var localTimeZoneAbbreviation: String { return TimeZone.current.abbreviation() ?? "UTC" }
        formatter.timeZone = TimeZone.current
        formatter.locale = Locale.init(identifier: localTimeZoneAbbreviation)
        formatter.dateStyle = .medium
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
    
    func convertDateToLocalDateMediumString() -> String {
        return Date.localDateMedium.string(from: self)
    }
}
