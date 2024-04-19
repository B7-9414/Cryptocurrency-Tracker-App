//
//  HomeView.swift
//  CryptoTrackerApp
//
//  Created by Bassam on 4/7/24.
//

import SwiftUI


struct HomeView: View {
    @EnvironmentObject private var vm: HomeViewModel
    @State private var showPortfolioSheet: Bool = false // show new sheet
    @State private var showPortfolioCoinsList: Bool = false     // animate button
    @State private var showSettingsView: Bool = false
    var body: some View {
        VStack {
            // WalkthroughView()
            //SettingsView()
//            StatisticView(stat: <#Statistic#>)
//            SearchBarView(searchText: Binding<String>)
            //homeHeader
            //MarketDataService ====> just for testing
        }
    }
    private var homeHeader: some View {
        HStack {
            CircleButtonView(iconName: showPortfolioCoinsList ? "plus" : "gear")
                .onTapGesture {
                    if showPortfolioCoinsList {
                        showPortfolioSheet.toggle()
                    } else {
                        showSettingsView.toggle()
                    }
                }
                .animation(.none, value: showPortfolioCoinsList)
                .background(CircleButtonAnimationView(animate: $showPortfolioCoinsList))
            
            Spacer()
            
            Text(showPortfolioCoinsList ? "Wallet" : "Prices")
                .font(.headline)
                .fontWeight(.heavy)
                .foregroundColor(.theme.accent)
                .animation(.none)
            
            Spacer()
            
            CircleButtonView(iconName: "chevron.right")
                .rotationEffect(Angle(degrees: showPortfolioCoinsList ? 180 : 0))
                .onTapGesture {
                    withAnimation(.spring()) {
                        showPortfolioCoinsList.toggle()
                    }
                }
        }
        .padding(.horizontal)
        
    }
}
