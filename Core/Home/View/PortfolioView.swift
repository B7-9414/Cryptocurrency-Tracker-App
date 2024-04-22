//
//  PortfolioView.swift
//  CryptoTrackerApp
//
//  Created by Bassam on 4/22/24.
//

import SwiftUI

struct PortfolioView: View {
    @Environment(\.dismiss) private var dismiss
    @EnvironmentObject private var vm: HomeViewModel
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading, spacing: 0) {
                    SearchBarView(searchText: $vm.searchText)
                                        
                    if vm.selectedCoin != nil {
                        portfolioInputSection
                    }
                }
            }
            .navigationTitle("Edit portfolio")
            .toolbar(content: {
                ToolbarItem(placement: .navigationBarLeading) {
                    XMarkButton {
                        vm.searchText = ""
                        self.dismiss()
                    }
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    trailingNavbarButton
                }
            })
        }
        .accentColor(.theme.accent)
        .onChange(of: vm.searchText) { value in
            if value == "" {
                vm.removeSelectedCoin()
            }
        }
    }
}

extension PortfolioView {
    private var searchListCoins: [Coin] {
        // if there're coins in portfolio and search string is empty, than will be shown allCoins,
        // otherwise will portfolio coins
        vm.searchText.isEmpty && !vm.portfolioCoins.isEmpty ? vm.portfolioCoins : vm.allCoins
    }
      
    private var portfolioInputSection: some View {
        VStack(spacing: 20) {
            HStack {
                Text("Current price of \(vm.selectedCoin?.symbol.uppercased() ?? ""):")
                
                Spacer()
                
                Text("\(vm.selectedCoin?.currentPrice.asCurrencyWith6Decimals() ?? "")")
            }
            
            Divider()
            
            HStack {
                Text("Add Amount in portfolio: ")
                
                Spacer()
                
                TextField("Ex: 1.4", text: $vm.coinsQuantityText)
                    .multilineTextAlignment(.trailing)
                    .keyboardType(.decimalPad)
            }
            
            Divider()
            
            HStack {
                Text("Current value:")
                
                Spacer()
                
                Text(vm.getCurrentValueOfHoldings().asCurrencyWith2Decimals())
            }
        }
        .animation(.none, value: 0)
        .padding()
        .font(.headline)
    }
    
    private var trailingNavbarButton: some View {
        HStack {
            if let selectedCoin = vm.selectedCoin,
               selectedCoin.currentHoldings != vm.coinsQuantityText.asDouble() {
                Button(action: {
                    saveButtonPressed()
                }, label: {
                    Text("Save".uppercased())
                        .font(.headline)
                })
            }
        }
    }
    
    private func updateSelectedCoins(coin: Coin) {
        vm.selectedCoin = coin
        
        if let portfolioCoin = vm.portfolioCoins.first(where: { $0.id == coin.id }),
           let amount = portfolioCoin.currentHoldings {
            vm.coinsQuantityText = "\(amount)"
        } else {
            vm.coinsQuantityText = ""

        }
        
    }
    
    private func saveButtonPressed() {
        guard let coin = vm.selectedCoin,
              let amount = vm.coinsQuantityText.asDouble() else { return }
        
        vm.updatePortfolio(coin: coin, amount: amount)
        
        vm.showCheckmark = true
        vm.removeSelectedCoin()
        
        // hide keyboard
        UIApplication.shared.endEditing()
        
        // hide checkmark
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            vm.showCheckmark = false
        }
    }

}

