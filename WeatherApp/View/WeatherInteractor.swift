//
//  WeatherInteractor.swift
//  WeatherApp
//
//  Created by Mohau Mpoti on 24/05/2021.
//

import Foundation
import CoreLocation

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
