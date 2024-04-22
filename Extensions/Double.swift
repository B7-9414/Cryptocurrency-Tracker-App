//
//  Double.swift
//  CryptoTrackerApp
//
//  Created by Bassam on 4/16/24.
//

import Foundation

extension Double {
    
    /// Converts Double to Currency wuth 2 decimal places
    /// ```
    /// Convert 1234.56 to $1234.56
    /// Convert 12.3456 to $12.3456
    /// Convert 0.123456 to $0.123456
    /// ```
    
    private var currencyFormatter2Decimals: NumberFormatter {
        let formatter = NumberFormatter()
        
        formatter.usesGroupingSeparator = true
        formatter.numberStyle = .currency
        formatter.locale = .current
        formatter.currencyCode = "usd"
        formatter.currencySymbol = "$"
        formatter.minimumFractionDigits = 2
        formatter.maximumFractionDigits = 2
        
        return formatter
    }
    private var currencyFormatter: NumberFormatter {
        let formatter = NumberFormatter()
        
        formatter.usesGroupingSeparator = true
        formatter.numberStyle = .currency
        formatter.locale = .current
        formatter.currencyCode = "usd"
        formatter.currencySymbol = "$"
        formatter.minimumFractionDigits = 2
        formatter.maximumFractionDigits = 6
        
        return formatter
    }
    
    /// Converts Double to Currency as a String wuth 2-6 decimal places
    /// ```
    /// Convert 1234.56 to $1234.56
    /// Convert 12.3456 to $12.3456
    /// Convert 0.123456 to $0.123456
    /// ```
    
    func asCurrencyWith6Decimals() -> String {
        let num = NSNumber(value: self)
        return currencyFormatter.string(from: num) ?? "$0.00"
    }
    
    
    /// Converts Double to Currency as a String wuth 2-6 decimal places
    /// ```
    /// Convert 1234.56 to $1234.56
    /// Convert 0.123456 to $0.12
    /// ```
    
    func asCurrencyWith2Decimals() -> String {
        let num = NSNumber(value: self)
        return currencyFormatter2Decimals.string(from: num) ?? "$0.00"
    }
    
    /// Converts Double to a String
    /// ```
    /// Convert 12.3456 to "12.34"
    /// ```
    
    func asNumberString() -> String {
        String(format: "%.2f", self)
    }
    
    /// Converts Double to a String with percent sign at the end
    /// ```
    /// Convert 12.3456 to "12.34%"
    /// ```
    
    func asPercentString() -> String {
        asNumberString() + "%"
    }
    
    
    
    /// Convert a Double to a String with K, M, Bn, Tr abbreviations.
    /// ```
    /// Convert 12 to 12.00
    /// Convert 1234 to 1.23K
    /// Convert 123456 to 123.45K
    /// Convert 12345678 to 12.34M
    /// Convert 1234567890 to 1.23Bn
    /// Convert 123456789012 to 123.45Bn
    /// Convert 12345678901234 to 12.34Tr
    /// ```
    func formattedWithAbbreviations() -> String {
        let num = abs(self)
        let sign = self < 0 ? "-" : ""
        let numberFormatter = NumberFormatter()
        numberFormatter.maximumFractionDigits = 2
        
        switch num {
        case 1_000_000_000_000...:
            let formatted = num / 1_000_000_000_000
            numberFormatter.numberStyle = .decimal
            return "\(sign)\(numberFormatter.string(for: formatted) ?? "")T"
        case 1_000_000_000...:
            let formatted = num / 1_000_000_000
            numberFormatter.numberStyle = .decimal
            return "\(sign)\(numberFormatter.string(for: formatted) ?? "")B"
        case 1_000_000...:
            let formatted = num / 1_000_000
            numberFormatter.numberStyle = .decimal
            return "\(sign)\(numberFormatter.string(for: formatted) ?? "")M"
        case 1_000...:
            let formatted = num / 1_000
            numberFormatter.numberStyle = .decimal
            return "\(sign)\(numberFormatter.string(for: formatted) ?? "")K"
        default:
            return "\(sign)\(self)"
        }
    }
}
