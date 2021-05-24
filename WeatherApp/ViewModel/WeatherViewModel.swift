//
//  WeatherViewModel.swift
//  WeatherApp
//
//  Created by Mohau Mpoti on 24/05/2021.
//

import Foundation

struct WeatherViewModel {
    let weatherType: WeatherType?
    let city: String
    let temperature: Double
    let minTemperature: Double
    let maxTemperature: Double
    
    var temperatureAsString: String {
        "\(Int(temperature.toCelsius))° C"
    }
    
    var minTemperatureAsString: String {
        "\(Int(minTemperature.toCelsius))° C"
    }
    
    var maxTemperatureAsString: String {
        "\(Int(maxTemperature.toCelsius))° C"
    }
}
