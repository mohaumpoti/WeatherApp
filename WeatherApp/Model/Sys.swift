//
//  Sys.swift
//  WeatherApp
//
//  Created by Mohau Mpoti on 23/05/2021.
//

import Foundation

struct Sys: Codable {
    let type: Int
    let id: Int
    let country: String
    let sunrise: Int
    let sunset: Int
}
