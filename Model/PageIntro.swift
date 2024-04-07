//
//  PageIntro.swift
//  CryptoTrackerApp
//
//  Created by Bassam on 4/7/24.
//

import SwiftUI

/// Page Intro Model
struct PageIntro: Identifiable, Hashable {
    var id: UUID = .init()
    var introAssetImage: String
    var title: String
    var subTitle: String
    var displaysAction: Bool = false
}

var pageIntros: [PageIntro] = [
    .init(introAssetImage: "Page 1", title: "Track your\nCryptocurrencies", subTitle: "Track cryptocurrencies and real value trade with ease and confidence in one safe and fast applications.Maximize your returns with our advanced optimization features. Our platform analyzes your portfolio and suggests adjustments to help you achieve your investment goals. "),
    .init(introAssetImage: "Page 2", title: "Discover the Best\nCoins", subTitle: "Looking to explore the world of cryptocurrencies and find the best investment opportunities? Look no further! Our platform offers a comprehensive exploration of the top-performing coins and tokens in the market."),
    .init(introAssetImage: "Page 3", title: "Let's\nGet Started", subTitle: "To register for an account, kindly enter your details.", displaysAction: true),
]

