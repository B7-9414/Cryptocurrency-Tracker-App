//
//  LAContext.swift
//  CryptoTrackerApp
//
//  Created by Bassam on 4/9/24.
//

import Foundation
import LocalAuthentication

extension LAContext {
    
    enum BiometricType: String {
            case none
            case faceID
        }
        
        var biometricType: BiometricType {
            var error: NSError?
            
            guard self.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) else {
                return .none
            }
            
            if #available(iOS 17.4, *) {
                switch self.biometryType {
                    case .none:
                        return .none
                    case .faceID:
                        return .faceID
                    case .opticID:
                        return .none
                    @unknown default:
                        fatalError("The new biometry type was added. Should handle it")
                }
            }
            
            return .none // Remove Touch ID from the returned biometric types
        }
    }
