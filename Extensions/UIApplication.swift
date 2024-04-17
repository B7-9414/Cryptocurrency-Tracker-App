//
//  UIApplication.swift
//  CryptoTrackerApp
//
//  Created by Bassam on 4/17/24.
//

import Foundation
import SwiftUI

extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
