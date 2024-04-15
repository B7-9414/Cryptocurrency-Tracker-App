//
//  HomeView.swift
//  CryptoTrackerApp
//
//  Created by Bassam on 4/7/24.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        VStack {
            // WalkthroughView()
            //SettingsView()
            homeHeader 
        }
    }
    private var homeHeader: some View {
            HStack {
                CircleButtonView(iconName: "gear")
                
                Spacer()
                
                Text("Prices")
                    .font(.headline)
                    .fontWeight(.heavy)
                    .foregroundColor(.black)
                    .animation(.none)
                
                Spacer()
                
                CircleButtonView(iconName: "chevron.right")
                    .rotationEffect(Angle(degrees: 0))
                    .onTapGesture {
                
                    }
            }
            .padding(.horizontal)
        }
    }
