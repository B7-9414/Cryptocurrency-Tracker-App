//
//  CryptoTrackerApp.swift
//  CryptoTrackerApp
//
//  Created by Bassam on 4/21/24.
//

import SwiftUI

@main
struct CryptoTrackerApp: App {
    @StateObject private var homeVM = HomeViewModel()
    @StateObject private var loginVM = LoginViewModel()

    init() {
//        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor(.theme.accent)]
//        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor(.theme.accent)]
    }

    var body: some Scene {
        WindowGroup {
            RootView()
                .environmentObject(homeVM)
                .environmentObject(loginVM)
            
        }
    }
}
