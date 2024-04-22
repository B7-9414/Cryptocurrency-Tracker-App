//
//  Date.swift
//  CryptoTrackerApp
//
//  Created by Bassam on 4/21/24.
//

import Foundation


extension Date {
    //  "2024-04-021T00:00:00.000Z"
    init(coinGeckoString: String) {
        let formatter = DateFormatter()
        
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        
        let date = formatter.date(from: coinGeckoString) ?? Date()
        self.init(timeInterval: 0, since: date)
    }
    
    private var shortFormatter: DateFormatter {
        let formatter = DateFormatter()
        
        formatter.dateStyle = .short
        formatter.dateFormat = "dd/MM/yy"
        
        return formatter
    }
    
    func asShortDateString() -> String {
        shortFormatter.string(from: self)
    }
}
