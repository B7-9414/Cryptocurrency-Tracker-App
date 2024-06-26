//
//  LoginScreen.swift
//  CryptoTrackerApp
//
//  Created by Bassam on 4/11/24.
//

import Foundation
import SwiftUI

struct LoginScreen: View {
    @EnvironmentObject var vm: LoginViewModel

    private let columns: [GridItem] = [
        GridItem(.flexible(minimum: 65, maximum: 95)),
        GridItem(.flexible(minimum: 65, maximum: 95)),
        GridItem(.flexible(minimum: 65, maximum: 95))
    ]
    
    var body: some View {
        VStack {
            
            inputCircles
            
            numpadBlock
                .disabled(vm.isNumpadDisabled)
        }
        .task {
            await vm.tryMakeBiometryAuth()
        }
    }
}


extension LoginScreen {
    private var biometryLoginButton: some View {
        Button {
            Task {
                await vm.tryMakeBiometryAuth()
            }
        } label: {
            Image(systemName: vm.biometryAuthIconName)
                .font(.title)
                .foregroundColor(.theme.accent)
                .background(Color.theme.background)
                .padding()
                .overlay(
                    RoundedRectangle(cornerRadius: 6)
                        .stroke()
                        .foregroundColor(.theme.accent)
                )
//                .hidden(!vm.isBiometryAuthAvailable)
            
        }
    }
    
    private var numpadBlock: some View {
        LazyVGrid(columns: columns) {
            ForEach(1..<10) { num in
                Button {
                    vm.numpadButtonWasPressed(number: num)
                } label: {
                    Text("\(num)")
                        .font(.largeTitle)
                        .padding(.horizontal, 5)
                        .padding(.vertical, 25)
                        .foregroundColor(.theme.accent)
                }
                
            }
            
            biometryLoginButton
            
            Button {
                vm.numpadButtonWasPressed(number: 0)
            } label: {
                Text("0")
                    .font(.largeTitle)
                    .padding(.horizontal, 5)
                    .padding(.vertical, 25)
                    .foregroundColor(.theme.accent)
            }
            
            Button {
                vm.numpadRemoveButtonWasPressed()
            } label: {
                Image(systemName: "delete.left")
                    .foregroundColor(.theme.accent)
                    .font(.largeTitle)
                    .padding(.horizontal, 5)
                    .padding(.vertical, 25)
//                    .hidden(vm.isRemoveButtonHidden)
            }
        }
    }
    
    private var inputCircles: some View {
        HStack {
            ForEach(0..<4) { num in
                if vm.authStatus == .unathorized {
                    // `vm.pincodeInput.count <= num` checks the position of the circle and the number of entered numbers
                    // if positin of th cricle is bigger, then number of entered numbers, the circle must be "empty"(stroke)
                    inputCircle(isStroke: vm.pincodeInput.count <= num, foregroundColor: .theme.accent)
                        .scaleEffect(vm.scaleAmountsForCirles[num])
                } else if vm.authStatus == .successfullyAuthorized {
                    inputCircle(foregroundColor: .theme.green)
                        .scaleEffect(vm.scaleAmountsForCirles[num])
                } else {
                    inputCircle(foregroundColor: .theme.red)
                        .scaleEffect(vm.scaleAmountsForCirles[num])
                }
            }
        }
    }
    
    @ViewBuilder private func inputCircle(isStroke: Bool = false, foregroundColor: Color) -> some View {
        if isStroke {
            Circle()
                .stroke()
                .frame(width: 13)
                .padding(10)
                .foregroundColor(foregroundColor)
        } else {
            Circle()
                .frame(width: 13)
                .padding(10)
                .foregroundColor(foregroundColor)
        }

    }
}
