//
//  WeatherViewModel.swift
//  WeatherApp
//
//  Created by Mohau Mpoti on 24/05/2021.
//

import Foundation
import UIKit

struct WeatherViewModel {
    let weatherType: WeatherType?
    let city: String
    let temperature: Double
    let minTemperature: Double
    let maxTemperature: Double
    
    var backgroundImage: UIImage? {
        weatherType?.backgroundImage
    }
    
    var backgroundColor: UIColor? {
        weatherType?.backgroundColor
    }
    
    var description: String? {
        weatherType?.description
    }
    
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
