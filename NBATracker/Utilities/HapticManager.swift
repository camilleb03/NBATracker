//
//  HapticManager.swift
//  NBATracker
//
//  Created by Camille Bourbonnais on 2021-06-17.
//

import Foundation
import SwiftUI

class HapticManager {
    
    static private let generator = UINotificationFeedbackGenerator()
    
    static func notification(type: UINotificationFeedbackGenerator.FeedbackType) {
        generator.notificationOccurred(type)
    }
}
