//
//  RootView.swift
//  CryptoTrackerApp
//
//  Created by Bassam on 4/10/24.
//

import SwiftUI

struct RootView: View {
    @StateObject private var homeVM = HomeViewModel()
    @StateObject private var loginVM = LoginViewModel()
    @Environment(\.scenePhase) private var scenePhase
    @AppStorage("hasCompletedWalkthrough") private var hasCompletedWalkthrough = false 
    
    var body: some View {
        ZStack {
            if !hasCompletedWalkthrough { // Check if the user has completed the walkthrough
                WalkthroughView() // Show the walkthrough view
                if loginVM.shouldShowLaunchView {
                    LaunchView()
                        .environmentObject(loginVM)
                }
            } else if loginVM.shouldShowLoginView {
                LoginScreen()
                    .environmentObject(loginVM)
            } else {
                NavigationView {
                    HomeView()
                        .navigationBarHidden(true)
                }
                .navigationViewStyle(StackNavigationViewStyle())
                .environmentObject(homeVM)
            }
        }
        .onAppear {
                    // This code will run when the RootView appears
                    guard let cacheURL = FileManager.default.urls(for: .cachesDirectory, in: .userDomainMask).first else {
                        return
                    }
                    let coinImagesURL = cacheURL.appendingPathComponent("coin_images")
                    print("coinImagesURL: \(coinImagesURL)")
                }
        }
}
