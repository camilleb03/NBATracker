//
//  GameStatistic.swift
//  NBATracker
//
//  Created by Camille Bourbonnais on 2021-06-21.
//

import Foundation

struct GameStatistic<T>: Identifiable {
    
    let id = UUID().uuidString
    let title: String
    let value: T
 
    init(title: String, value: T) {
        self.title = title
        self.value = value
    }
}
