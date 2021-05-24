//
//  Double+Extension.swift
//  WeatherApp
//
//  Created by Mohau Mpoti on 24/05/2021.
//

import Foundation

extension Double {
    // converts from Kelvin to Celcious
    var toCelcious: Double {
        self - 273.15
    }
}
