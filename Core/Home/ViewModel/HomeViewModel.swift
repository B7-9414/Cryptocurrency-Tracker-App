//
//  HomeViewModel.swift
//  CryptoTrackerApp
//
//  Created by Bassam on 4/14/24.
//

import Foundation
class HomeViewModel: ObservableObject {
    @Published var allCoins: [Coin] = []
    @Published var portfolioCoins: [Coin] = []
    @Published var searchText: String = ""
    @Published var isLoading: Bool = false
    @Published var stats: [Statistic] = []
    private let coinDataService = CoinDataService()

    func reloadData() {
        isLoading = true
        coinDataService.getCoins()
        HapticVibrationManager.notification(type: .success)
    }
    private func mapGlobalMarketData(marketDataModel: MarketData?, portfolioCoins: [Coin]) -> [Statistic] {
        var stats: [Statistic] = []
        
        guard let data = marketDataModel else { return stats }
        
        let marketCap = Statistic(title: "Market Cap",
                                  value: data.marketCap,
                                  percentageChange: data.marketCapChangePercentage24HUsd)
        
        let volume = Statistic(title: "24h usd Volume", value: data.volume)
        let btcDominance = Statistic(title: "BTC Dominance", value: data.btcDominance)
        
        let portfolioValue = portfolioCoins
            .map { $0.currentHoldingsValue }
            .reduce(0, +)
        
        let previousValue = portfolioCoins
            .map { coin -> Double in
                let currentValue = coin.currentHoldingsValue
                let percentCahnge = coin.priceChangePercentage24H ?? 0 / 100
                let previousValue = currentValue / (1 + percentCahnge)
                
                return previousValue
            }
            .reduce(0, +)
        
        let percentageChange = (portfolioValue - previousValue) / previousValue
        
        let portfolio = Statistic(title: "Portfolio Value test",
                                  value: portfolioValue.asCurrencyWith2Decimals(),
                                  percentageChange: percentageChange.isNaN ? 0 : percentageChange)
        
        stats.append(contentsOf: [marketCap, volume, btcDominance, portfolio])
        
        return stats
    }
}
