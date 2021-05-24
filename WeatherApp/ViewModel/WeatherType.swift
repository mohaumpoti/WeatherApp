//
//  WeatherType.swift
//  WeatherApp
//
//  Created by Mohau Mpoti on 24/05/2021.
//

import Foundation
import UIKit

enum WeatherType: String {
    case clouds
    case rain
    case clear
    
    var backgroundImage: UIImage? {
        switch self {
        case .clouds: return UIImage(named: "cloudy")
        case .rain: return UIImage(named: "rainy")
        case .clear: return UIImage(named: "sunny")
        }
    }
    
    var icon: UIImage? {
        switch self {
        case .clouds: return UIImage(named: "partlysunny")
        case .rain: return UIImage(named: "rain")
        case .clear: return UIImage(named: "clear")
        }
    }
    
    var description: String? {
        switch self {
        case .clouds: return "Cloudy"
        case .rain: return "Rainy"
        case .clear: return "Sunny"
        }
    }
    
    var backgroundColor: UIColor? {
        switch self {
        case .clouds: return UIColor(red: 0.33, green: 0.44, blue: 0.48, alpha: 1.00)
        case .rain: return UIColor(red: 0.34, green: 0.34, blue: 0.36, alpha: 1.00)
        case .clear: return UIColor(red: 0.28, green: 0.67, blue: 0.18, alpha: 1.00)
        }
    }
}
