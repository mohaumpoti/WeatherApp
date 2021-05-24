//
//  Data+Extension.swift
//  WeatherApp
//
//  Created by Mohau Mpoti on 23/05/2021.
//

import Foundation

extension Data {
    func act_description() -> String? {
        return String(data: self, encoding: .utf8)
    }
    /// Returns valid JSON string id possible
    func act_JSONString() -> NSString? {
        guard let _ = try? JSONSerialization.jsonObject(with: self, options: []) else {
            return nil // data cannot be deserialized, invalid JSON
        }
        guard let str = String(data: self, encoding: .utf8) else {
            return nil // data to string conversation failed
        }
        // NSString conversion necessary, Swift.String is an escaped string ):
        return NSString(string: str)
    }
}
