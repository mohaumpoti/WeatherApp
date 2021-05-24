//
//  Weather.swift
//  WeatherApp
//
//  Created by Mohau Mpoti on 23/05/2021.
//

import Foundation

struct Weather: Codable {
    let id: Int
    let main: String
    let description: String
    let icon: String
}
