//
//  CircleButtonAnimationView.swift
//  CryptoTrackerApp
//
//  Created by Bassam on 4/13/24.
//

import SwiftUI

struct CircleButtonAnimationView: View {
    @Binding var animate: Bool
    
    var body: some View {
        Circle()
            .stroke(lineWidth: animate ? 1 : 5)
            .scale(animate ? 1 : 0)
            .opacity(animate ? 0 : 1)
            .animation(animate ? .easeOut(duration: 1) : nil, value: animate)
    }
}
