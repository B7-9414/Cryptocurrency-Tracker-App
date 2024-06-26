//
//  LaunchView.swift
//  CryptoTrackerApp
//
//  Created by Bassam on 4/7/24.
//

import SwiftUI

struct LaunchView: View {
    @EnvironmentObject var vm: LoginViewModel
    @State private var loadingText = "Loading coins..."
    @State private var textOpacity = 1.0
    
    var body: some View {
        ZStack {
            Color.launch.background
                .ignoresSafeArea()
            Image("logo-transparent")
                .resizable()
                .frame(width: 100, height: 100)
            
            ZStack {
                Text(loadingText)
                    .font(.headline)
                    .foregroundColor(.launch.accent)
                    .fontWeight(.heavy)
                    .offset(y: 70)
                    .opacity(textOpacity)
            }
            .onAppear {
                Task {
                    await vm.tryMakeBiometryAuth()
                }
                
                withAnimation(.linear(duration: 1.3).repeatForever(autoreverses: true)) {
                    textOpacity = 0.6
                }
            }
        }
    }
}
