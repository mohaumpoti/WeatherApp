//
//  WeatherForecastResponse.swift
//  WeatherApp
//
//  Created by Mohau Mpoti on 23/05/2021.
//

import Foundation

struct WeatherForecastResponse: Codable {
    let cod: String
    let message: Int
    let cnt: Int
    let list: [WeatherForecastItem]
    let city: City
    let country: String?
    let population: Int?
    let timezone: Int?
    let sunrise: Int?
    let sunset: Int?
    
    var viewModels: [WeatherForecastItem] {
        let listGroupedByDay =
            Dictionary(grouping: list,
                              by: { Calendar.current.startOfDay(for: Date(timeIntervalSince1970: TimeInterval($0.dt))) })
                   .compactMap { $0.value.first }
        
        let listSortedByDate = listGroupedByDay.sorted {
            let firstDate = Date(timeIntervalSince1970: TimeInterval($0.dt))
            let secondDate = Date(timeIntervalSince1970: TimeInterval($1.dt))
            return firstDate < secondDate
        }
        
        return listSortedByDate
    }
}
