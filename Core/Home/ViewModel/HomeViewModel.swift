//
//  HomeViewModel.swift
//  CryptoTrackerApp
//
//  Created by Bassam on 4/14/24.
//

import Foundation
class HomeViewModel: ObservableObject {
    @Published var isLoading: Bool = false

    func reloadData() {
        isLoading = true
    }
}
