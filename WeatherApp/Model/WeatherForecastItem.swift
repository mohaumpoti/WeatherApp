//
//  WeatherForecastItem.swift
//  WeatherApp
//
//  Created by Mohau Mpoti on 23/05/2021.
//

import Foundation
import UIKit

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
    
    var weekday: String {
        let date = Date(timeIntervalSince1970: TimeInterval(dt))
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE"
        
        return dateFormatter.string(from: date)
    }

    var icon: UIImage? {
        guard let mainWeather = weather.first?.main else { return nil }
        let weatherType = WeatherType(rawValue: mainWeather.lowercased())
        
        return weatherType?.icon
    }
    
    var temperatureAsString: String {
        "\(Int(main.temp.toCelsius))° C"
    }
    
    var minTemperatureAsString: String {
        "\(Int(main.temp_min.toCelsius))° C"
    }

    var maxTemperatureAsString: String {
        "\(Int(main.temp_max.toCelsius))° C"
    }
}
