//
//  XMarkButton.swift
//  CryptoTrackerApp
//
//  Created by Bassam on 4/12/24.
//

import Foundation
import SwiftUI

struct XMarkButton: View {

    let action: () -> ()
    
    var body: some View {
        Button(action: action, label: {
            Image(systemName: "xmark")
                .font(.headline)
        })
    }
}
