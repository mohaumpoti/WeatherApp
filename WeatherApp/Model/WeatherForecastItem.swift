//
//  WeatherForecastItem.swift
//  WeatherApp
//
//  Created by Mohau Mpoti on 23/05/2021.
//

import Foundation

struct WeatherForecastItem: Codable {
    let dt: Int
    let main: MainForecast
    let weather: [Weather]
    let clouds: Cloud
    let wind: Wind
    let visibility: Int
    let pop: Int
    let rain: Rain?
    let sys: SysForecast
    let dt_txt: String
}
