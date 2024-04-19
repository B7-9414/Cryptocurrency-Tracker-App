//
//  MarketDataService.swift
//  CryptoTrackerApp
//
//  Created by Bassam on 4/19/24.
//

import Foundation
import Combine

class MarketDataService {
    @Published var marketData: MarketData? = nil
    
    private var marketDataSubscription: AnyCancellable?
    
    init() {
        getData()
    }
    
    func getData() {
        guard let url = URL(string: "https://api.coingecko.com/api/v3/global")
        else { return }
        
        marketDataSubscription = NetworkManager.download(from: url)
            .decode(type: GlobalData.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: NetworkManager.handleCompletion,
                  receiveValue: { [weak self] returnedData in
                    self?.marketData = returnedData.data
                    self?.marketDataSubscription?.cancel()
//                if let marketData = self?.marketData, let rubMarketCap = marketData.totalMarketCap["rub"] {
//                    print("Market data received: Total Market Cap for RUB: \(rubMarketCap)")
//                    print("Market data received: Total Market Cap for RUB: \(marketData)")
//
//                }

                  })
    }
}
