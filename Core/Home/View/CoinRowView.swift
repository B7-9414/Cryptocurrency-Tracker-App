//
//  CoinRowView.swift
//  CryptoTrackerApp
//
//  Created by Bassam on 4/22/24.
//

import SwiftUI

struct CoinRowView: View {
    let coin: Coin
    let showHoldingsColumn: Bool
    
    var body: some View {
        HStack(spacing: 0) {
            leftColumn
            
            Spacer()
            
            if showHoldingsColumn {
               centerColumn
            }
                
            rightColumn
         
        }
        .font(.subheadline)
        .background(
            Color.theme.background.opacity(0.001)
        )
    }
}


extension CoinRowView {
    private var leftColumn: some View {
        HStack(spacing: 0) {
            Text("\(coin.rank)")
                .font(.caption)
                .foregroundColor(.theme.secondaryText)
                .frame(minWidth: 30)
            
                .frame(width: 30, height: 30)
            
            Text(coin.symbol.uppercased())
                .font(.headline)
                .padding(.leading, 6)
                .foregroundColor(.theme.accent)
        }
    }
    
    
    private var centerColumn: some View {
        VStack(alignment: .trailing) {
            Text(coin.currentHoldingsValue.asCurrencyWith2Decimals())
                .bold()
            Text((coin.currentHoldings ?? 0).asNumberString())
        }
        .foregroundColor(.theme.accent)
    }
    
    
    private var rightColumn: some View {
        VStack(alignment: .trailing, spacing: 4) {
        
            Text("\(coin.currentPrice.asCurrencyWith6Decimals())")
                .bold()
                .foregroundColor(.theme.accent)
            HStack(spacing: 4) {
                Image(systemName: "triangle.fill")
                    .font(.caption2)
                    .rotationEffect(Angle(degrees: (coin.priceChangePercentage24H ?? 0) >= 0 ? 0 : 180))

                Text(coin.priceChangePercentage24H?.asPercentString() ?? "")
                //                .foregroundColor((coin.priceChangePercentage24H ?? 0) >= 0 ?
                //                                    .theme.green :
                //                                    .theme.red
                //                )
            }
        }
        .foregroundColor((coin.priceChangePercentage24H ?? 0) >= 0 ? .theme.green : .theme.red)
        .opacity(coin.priceChangePercentage24H == nil ? 0 : 1)
        .frame(width: UIScreen.main.bounds.width / 3.5, alignment: .trailing)
    }
}
