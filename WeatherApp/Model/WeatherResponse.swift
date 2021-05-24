//
//  WeatherResponse.swift
//  WeatherApp
//
//  Created by Mohau Mpoti on 23/05/2021.
//

import Foundation

struct WeatherResponse: Codable {
    let coord: Coordinate
    let weather: [Weather]
    let base: String
    let main: Main
    let visibility: Int
    let wind: Wind
    let clouds: Cloud
    let dt: Int
    let sys: Sys
    let timezone: Int
    let id: Int
    let name: String
    let cod: Int
    
    var viewModel: WeatherViewModel {
        var weatherType: WeatherType?
        if let mainWeather = weather.first?.main {
            weatherType = WeatherType(rawValue: mainWeather.lowercased())
        }
        return .init(
            weatherType: weatherType,
            city: name,
            temperature: "\(Int(main.temp.toCelcious))° C",
            minTemperature: "\(Int(main.temp_min.toCelcious))° C",
            maxTemperature: "\(Int(main.temp_max.toCelcious))° C"
        )
    }
}
