//
//  Data.swift
//  CryptoTrackerApp
//
//  Created by Bassam on 4/11/24.
//

import Foundation


extension Data {
    func asString(encoding: String.Encoding = .utf8) -> String? {
        String(data: self, encoding: encoding)
    }
}
