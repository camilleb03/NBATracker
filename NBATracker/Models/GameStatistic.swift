//
//  GameStatistic.swift
//  NBATracker
//
//  Created by Camille Bourbonnais on 2021-06-21.
//

import Foundation

struct GameStatistic: Identifiable {
    
    let id = UUID().uuidString
    let title: String
    let value: String
 
    init(title: String, value: String) {
        self.title = title
        self.value = value
    }
}
