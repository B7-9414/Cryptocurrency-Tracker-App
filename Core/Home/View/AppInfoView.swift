//
//  AppInfoView.swift
//  CryptoTrackerApp
//
//  Created by Bassam on 4/22/24.
//

import SwiftUI

struct AppInfoView: View {
    @Environment(\.dismiss) private var dismiss

    let youtubeReels = URL(string: "https://www.easycodeing.com/")!
    
    var body: some View {
        NavigationView {
            List {
                
                appInfo
                
                YoutubeReels
            }
            .font(.headline)
            .accentColor(.blue)
            .listStyle(GroupedListStyle())
            .navigationTitle("App Info")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    XMarkButton {
                        self.dismiss()
                    }
                    .font(.headline)
                }
            }
        }
    }
}


extension AppInfoView {
    private var appInfo: some View {
        Section(header: Text("How the app works ?")) {
            VStack(alignment: .leading) {
                Image("logo")
                    .resizable()
                    .frame(width: 100, height: 100)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                
                Text("Track cryptocurrencies and real value trade with ease and confidence in one safe and fast applications.Maximize your returns with our advanced optimization features. Our platform analyzes your portfolio and suggests adjustments to help you achieve your investment goals. ")
                    .font(.callout)
                    .fontWeight(.medium)
                    .foregroundColor(.theme.accent)
            }
        }
    }
    
    private var YoutubeReels: some View {
        Section(header: Text("Demo")) {
            VStack(alignment: .leading) {
                Image("logo")
                    .resizable()
                    .frame(height: 100)
                    .scaledToFit()
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                
                Text("This is a youtube to show user how to use the app")
                    .font(.callout)
                    .fontWeight(.medium)
                    .foregroundColor(.theme.accent)
            }
            
            Link("Youtube Reels Demo", destination: youtubeReels)
        }
    }
}
