//
//  KeyboardResponder.swift
//  CryptoTrackerApp
//
//  Created by Bassam on 4/23/24.
//

import SwiftUI

class KeyboardResponder: ObservableObject {
    private var notificationCenter: NotificationCenter
    @Published var currentHeight: CGFloat = 0

    init(center: NotificationCenter = .default) {
        notificationCenter = center
        notificationCenter.addObserver(self, selector: #selector(keyboardWillShow(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        notificationCenter.addObserver(self, selector: #selector(keyboardWillHide(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }

    deinit {
        notificationCenter.removeObserver(self)
    }

    @objc func keyboardWillShow(_ notification: Notification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            currentHeight = keyboardSize.height
        }
    }

    @objc func keyboardWillHide(_ notification: Notification) {
        currentHeight = 0
    }
}
