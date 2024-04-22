//
//  SettingsView.swift
//  CryptoTrackerApp
//
//  Created by Bassam on 4/12/24.
//

import SwiftUI

struct SettingsView: View {
    @Environment(\.dismiss) private var dismiss
    @StateObject private var vm = SettingsViewModel()
    @State private var showAppInfoView: Bool = false
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.theme.background
                    .ignoresSafeArea()
                
                List {
                    Section {
                        NavigationLink(destination: {
                            PrivacySettingsView()
                                .environmentObject(vm)
                        }) {
                            Label("Privacy and security", systemImage: "hand.raised.fill")
                                .labelStyle(ColorfulIconLabelStyle(color: .blue))
                        }

                    }
                }
            }
            .navigationTitle("Settings")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    XMarkButton {
                        self.dismiss()
                    }
                    .font(.headline)
                }
            }
            .foregroundColor(.theme.accent)

        }
    }
}
