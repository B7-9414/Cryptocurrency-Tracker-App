//
//  WalkthroughTextField.swift
//  CryptoTrackerApp
//
//  Created by Bassam on 4/7/24.
//

import SwiftUI

struct WalkthroughTextField: View {
    @Binding var text: String
    var hint: String
    var leadingIcon: Image
    var body: some View {
        HStack(spacing: -10) {
            leadingIcon
                .font(.callout)
                .foregroundColor(.gray)
                .frame(width: 40, alignment: .leading)
            TextField(hint, text: $text)
        }
        .padding(.horizontal, 15)
        .padding(.vertical, 15)
        .background {
            RoundedRectangle(cornerRadius: 12, style: .continuous)
                .fill(.gray.opacity(0.1))
        }
    }
}
