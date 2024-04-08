//
//  PushNotification.swift
//  CryptoTrackerApp
//
//  Created by Bassam on 4/7/24.
//

import Foundation
import UserNotifications

// Function to request notification permission
func requestNotificationPermission(completion: @escaping (Bool) -> Void) {
    UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge]) { granted, error in
        if granted {
            // Permission granted by the user
            print("Notification permission granted")
        } else {
            // Permission denied by the user
            print("Notification permission denied")
        }
        completion(granted)
    }
}

// Function to send welcome push notification
func sendWelcomePushNotification(email: String) {
    let content = UNMutableNotificationContent()
    content.title = "Welcome \(email)!"
    content.body = "Thank you for signing up. Enjoy using our app!"
    content.sound = UNNotificationSound.default
    
    // Create a trigger for scheduling the notification after 5 seconds
    let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
    
    // Create a request with a unique identifier, content, and trigger
    let request = UNNotificationRequest(identifier: "signupNotification", content: content, trigger: trigger)
    
    // Get the notification center and add the request
    let notificationCenter = UNUserNotificationCenter.current()
    notificationCenter.add(request) { error in
        if let error = error {
            print("Error scheduling notification: \(error.localizedDescription)")
        } else {
            print("Notification scheduled successfully")
        }
    }
}
