//
//  Rain.swift
//  WeatherApp
//
//  Created by Mohau Mpoti on 23/05/2021.
//

import Foundation

struct Rain: Codable {
    let rainIndicator: Double
    private enum CodingKeys: String, CodingKey {
        case rainIndicator = "3h"
    }
}
