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
            
            DisclosureGroup("1. Onboarding and Walkthrough") {
                VStack(alignment: .leading) {
                    Image("logo")
                        .resizable()
                        .frame(width: 100, height: 100)
                        .clipShape(RoundedRectangle(cornerRadius: 20))
                    
                    Text("When a user installs the app for the first time, they will encounter an onboarding/walkthrough sequence. In the final step of the walkthrough, the user must enter a username or email.")
                        .font(.callout)
                        .fontWeight(.medium)
                        .foregroundColor(.theme.accent)
                }
            }
            
            DisclosureGroup("2. Local Push Notification") {
                Text("After entering the email or username in the last step of the walkthrough, the user will receive a local push notification. Please exit the mobile app to view the notification.")
                    .font(.callout)
                    .fontWeight(.medium)
                    .foregroundColor(.theme.accent)
            }
            
            DisclosureGroup("3. Cryptocurrency List") {
                Text("The app displays a list of 100 cryptocurrencies sourced from the following Coingecko APIs:\n- Cryptocurrency Markets\n- Global Cryptocurrency Data")
                    .font(.callout)
                    .fontWeight(.medium)
                    .foregroundColor(.theme.accent)
            }
            
            DisclosureGroup("4. User Wallets/Portfolio") {
                Text("The user can view their wallets/portfolio with a nice UI featuring chevron.right and left animations. There are buttons for adding coins and accessing settings.")
                    .font(.callout)
                    .fontWeight(.medium)
                    .foregroundColor(.theme.accent)
            }
            
            DisclosureGroup("5. Sorting and Filtering") {
                Text("Users can sort the cryptocurrency list by rank, and filter by coin or specific coin prices (highest and lowest). They can also filter their own wallets/portfolio by prices, coins, or holdings.")
                    .font(.callout)
                    .fontWeight(.medium)
                    .foregroundColor(.theme.accent)
            }
            
            DisclosureGroup("6. Adding and Editing Coins") {
                Text("Users can add, edit, and delete coins from their wallets/portfolio. They can also filter their wallets/portfolio by prices, coins, or holdings.")
                    .font(.callout)
                    .fontWeight(.medium)
                    .foregroundColor(.theme.accent)
            }
            
            DisclosureGroup("7. Search Functionality") {
                Text("Users can search both the main coin list and their own wallets/portfolio. They can slide right on the main page for specific coins or use the plus button in the corner of the app.")
                    .font(.callout)
                    .fontWeight(.medium)
                    .foregroundColor(.theme.accent)
            }
            
            DisclosureGroup("8. Security Features") {
                Text("Users can set a pin code or use Face ID to secure the app. This feature must be enabled in the app's settings. Haptic feedback is provided while entering a pin code.")
                    .font(.callout)
                    .fontWeight(.medium)
                    .foregroundColor(.theme.accent)
            }
            
            DisclosureGroup("9. Detailed Coin Information") {
                Text("Users can view detailed information about specific coins, including descriptions, website links, and charts displaying weekly data. Chart colors indicate price changes.")
                    .font(.callout)
                    .fontWeight(.medium)
                    .foregroundColor(.theme.accent)
            }
            
            DisclosureGroup("10. Security Features") {
                Text("Users can set a pin code or use Face ID to secure the app. This feature must be enabled in the app's settings. Haptic feedback is provided while entering a pin code.")
                    .font(.callout)
                    .fontWeight(.medium)
                    .foregroundColor(.theme.accent)
            }
            
            DisclosureGroup("11. Haptic Feedback") {
                Text("When a user enters a pin code, haptic effects are triggered to provide feedback.")
                    .font(.callout)
                    .fontWeight(.medium)
                    .foregroundColor(.theme.accent)
            }
            DisclosureGroup("Notes") {
                VStack(alignment: .leading) {
                    Text("Note 1:")
                        .fontWeight(.bold)
                    Text("The app does not support offline mode, and sometimes there may be a delay in displaying the list of coins.")
                        .font(.callout)
                    
                    Text("Note 2:")
                        .fontWeight(.bold)
                    Text("The onboarding/walkthrough is displayed only once when the app is installed. Afterward, it is set to false. To test this, please delete the app and reinstall it.")
                        .font(.callout)
                    
                    Text("Note 3:")
                        .fontWeight(.bold)
                    Text("The app uses Core Data for timestamps, coin IDs, and amounts in the user's portfolio. This data remains available even after the user closes the app.")
                        .font(.callout)
                }
            }
        }
    }
    
    private var YoutubeReels: some View {
        Section(header: Text("Demo")) {
            VStack(alignment: .leading) {
                
                Text("This is a quick demonstration to show the user how to use the mobile app!")
                    .font(.callout)
                    .fontWeight(.medium)
                    .foregroundColor(.theme.accent)
            }
            
            Link("Youtube Reels Demo", destination: youtubeReels)
        }
    }
}
