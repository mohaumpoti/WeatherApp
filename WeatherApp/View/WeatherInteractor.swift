//
//  WeatherInteractor.swift
//  WeatherApp
//
//  Created by Mohau Mpoti on 24/05/2021.
//

import Foundation
import CoreLocation

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
            temperature: main.temp,
            minTemperature: main.temp_min,
            maxTemperature: main.temp_max
        )
    }
}

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

class WeatherInteractor: NSObject {
    
    // MARK: - View Properties
     
    private var currentLocation: CLLocation?
    private let locationManager = CLLocationManager()
    weak var view: WeatherViewController?
    
    // MARK: - Helpers
    
    func viewDidAppear() {
        setupLocation()
    }
    
    private func setupLocation() {
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
    }
}

// MARK: - CLLocationManagerDelegate

extension WeatherInteractor: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard !locations.isEmpty, currentLocation == nil else { return }
        currentLocation = locations.first
        locationManager.stopUpdatingLocation()
        
        guard let currentLocation = currentLocation else { return }
        requestWeather(for: currentLocation)
        requestForecast(for: currentLocation)
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        guard let errorDescription = (error as? CLError)?.errorDescription else {
            view?.update(with: "There was an error accsing the weather data")
            return
        }
        view?.update(with: errorDescription)
    }
    
    private func requestWeather(for location: CLLocation) {
        WebService.requestWeather(for: location) { [weak self] (result) in
            switch result {
            case .success(let response):
                DispatchQueue.main.async {
                    self?.view?.update(with: response.viewModel)
                }
            case .failure(let error):
                DispatchQueue.main.async {
                    self?.view?.update(with: error.localizedDescription)
                }
            }
        }
    }
    
    private func requestForecast(for location: CLLocation) {
        WebService.requestForecast(for: location) { [weak self] (result) in
            switch result {
            case .success(let response):
                self?.view?.viewModels = response.viewModels
            case .failure( _): break
            }
        }
    }
}
