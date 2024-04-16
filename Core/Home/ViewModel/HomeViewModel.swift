//
//  HomeViewModel.swift
//  CryptoTrackerApp
//
//  Created by Bassam on 4/14/24.
//

import Foundation
class HomeViewModel: ObservableObject {
    @Published var isLoading: Bool = false
    private let coinDataService = CoinDataService()

    func reloadData() {
        isLoading = true
        coinDataService.getCoins()
        HapticVibrationManager.notification(type: .success)
    }
    
}
