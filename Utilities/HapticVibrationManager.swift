//
//  HapticVibrationManager.swift
//  CryptoTrackerApp
//
//  Created by Bassam on 4/11/24.
//

import Foundation
import SwiftUI
//for user login/PINIput
class HapticVibrationManager {
    
    private static let generator = UINotificationFeedbackGenerator()
    
    static func notification(type: UINotificationFeedbackGenerator.FeedbackType) {
        generator.notificationOccurred(type)
    }
}
