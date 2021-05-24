//
//  CLError+Extension.swift
//  WeatherApp
//
//  Created by Mohau Mpoti on 24/05/2021.
//

import Foundation
import CoreLocation

extension CLError {
    var errorDescription: String? {
        switch self.code {
        case .denied: return "Location access is required for the WeatherApp to work"
        case .locationUnknown: return "Unknown location"
        case .network: return "The network is unavailable"
        case .promptDeclined: return "You didn't grant the requested temporary location authorization"
        default: return "There was an error retrieving the weather data"
        }
    }
}
