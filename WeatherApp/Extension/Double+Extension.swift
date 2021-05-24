//
//  Double+Extension.swift
//  WeatherApp
//
//  Created by Mohau Mpoti on 24/05/2021.
//

import Foundation

extension Double {
    /// converts the temperature from Kelvin to Celsius
    var toCelsius: Double {
        self - 273.15
    }
}
