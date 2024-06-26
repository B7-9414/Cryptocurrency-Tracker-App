//
//  PrivacySettingsView.swift
//  CryptoTrackerApp
//
//  Created by Bassam on 4/12/24.
//

import SwiftUI
import Combine

struct PrivacySettingsView: View {
    @EnvironmentObject private var vm: SettingsViewModel
//    @State private var showAutoLockTimeMenu: Bool = false
    
    var body: some View {
        ZStack {
            Color.theme.background
                .ignoresSafeArea()
            
            List {
                Section {
                    Toggle("Use password to unblock the app", isOn: vm.$isPasswordSecurityActive)
                        .onChange(of: vm.isPasswordSecurityActive) { newPasswordSecurityUsingStatus in
                            // if user disables password login, we should also disable using of biometry login
                            if newPasswordSecurityUsingStatus == false {
                                vm.useBiometryToUnlock = false
                            }
                        }
                }
                
                faceIDSection

                passwordSettingsSection
            }
        }
        .foregroundColor(.theme.accent)
        .navigationTitle("Privacy and security")
//        .confirmationDialog("Set auto-lock time", isPresented: $showAutoLockTimeMenu) {
//            autoLockTimeDialogMenu
//        }
    }
}

extension PrivacySettingsView {
    @ViewBuilder private var faceIDSection: some View {
        if vm.isPasswordSecurityActive {
            Section {
                HStack {
                    Label("Use Face ID", systemImage: "faceid")
                        .labelStyle(ColorfulIconLabelStyle(color: .theme.green))
                    
                    Spacer()
                    
                    Toggle("", isOn: vm.$useBiometryToUnlock)
                }
            }
        }
    }
    
    @ViewBuilder private var passwordSettingsSection: some View {
        if vm.isPasswordSecurityActive {
            NavigationLink("Change password", isActive: $vm.showPasswordInputView) {
                PasswordTextFieldView()
                    .environmentObject(vm)
            }
            
//            HStack {
//                Text("Auto-lock")
//                
//                Spacer ()
//                
//                Text("If away for \(vm.appAutoLockTimeSeconds / 60) min")
//                
//                Image(systemName: "chevron.right")
//                    .foregroundColor(.theme.secondaryText)
//            }
            //            .onTapGesture {
            //                showAutoLockTimeMenu.toggle()
            //            }
        }
    }
    // test
    //    @ViewBuilder private var autoLockTimeDialogMenu: some View {
    //        Button("if away for 1 minute") {
    //            vm.appAutoLockTimeSeconds = 60
    //        }
    //        }
    //}
    
    // The only purpose of this view is one bug with FocusState
    // It doesn't work within main view, so i made one view extra...
    fileprivate struct PasswordTextFieldView: View {
        @FocusState private var isPasswordTextFieldFocused: Bool
        @EnvironmentObject private var vm: SettingsViewModel
        
        var body: some View {
            ZStack {
                TextField("Enter your username", text: $vm.passwordText)
                    .focused($isPasswordTextFieldFocused)
                    .keyboardType(.numberPad)
                    .onReceive(Just($vm.passwordText)) { newValue in
                        let filtered = newValue.wrappedValue.filter { "0123456789".contains($0) }
                        if filtered != newValue.wrappedValue {
                            vm.passwordText = filtered
                        }
                        
                    }
                
                Color.theme.background.ignoresSafeArea()
                
                Text(vm.passwordText)
                    .foregroundColor(.white)
            }
            .task {
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                    self.isPasswordTextFieldFocused = true
                }
            }
        }
    }
}
