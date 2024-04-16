//
//  CoinModel.swift
//  CryptoTrackerApp
//
//  Created by Bassam on 4/15/24.
//

import Foundation

// CoinGecko API INFO
/*
    URL:
        https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=250&page=1&sparkline=true&price_change_percentage=24h
    JSON response:
    {
         "id": "bitcoin",
         "symbol": "btc",
         "name": "Bitcoin",
         "image": "https://assets.coingecko.com/coins/images/1/large/bitcoin.png?1547033579",
         "current_price": 38879,
         "market_cap": 728753565297,
         "market_cap_rank": 1,
         "fully_diluted_valuation": 817514501579,
         "total_volume": 41198949197,
         "high_24h": 40433,
         "low_24h": 37359,
         "price_change_24h": -184.51401636,
         "price_change_percentage_24h": -0.47235,
         "market_cap_change_24h": -1845419223.996338,
         "market_cap_change_percentage_24h": -0.25259,
         "circulating_supply": 18719943,
         "total_supply": 21000000,
         "max_supply": 21000000,
         "ath": 64805,
         "ath_change_percentage": -39.59337,
         "ath_date": "2021-04-14T11:54:46.763Z",
         "atl": 67.81,
         "atl_change_percentage": 57630.31299,
         "atl_date": "2013-07-06T00:00:00.000Z",
         "roi": null,
         "last_updated": "2021-05-27T22:14:17.678Z",
         "sparkline_in_7d": {
         "price": [
             40109.30184969603,
             40046.73321092796,
             ...
             39715.13065866956,
             38893.992727625984
         ]
         },
         "price_change_percentage_24h_in_currency": -0.4723470310289372
    }

*/

struct Coin: Identifiable, Codable {
    let id, symbol, name: String
    let image: String
    let currentPrice: Double
    let marketCap, marketCapRank, fullyDilutedValuation: Double?
    let totalVolume, high24H, low24H: Double?
    let priceChange24H, priceChangePercentage24H, marketCapChange24H, marketCapChangePercentage24H: Double?
    let circulatingSupply, totalSupply, maxSupply, ath: Double?
    let athChangePercentage: Double?
    let athDate: String?
    let atl, atlChangePercentage: Double?
    let atlDate: String?
    let lastUpdated: String?
    let priceChangePercentage24HInCurrency: Double?
    
    let currentHoldings: Double?
}
