//
//  WeatherViewModelTests.swift
//  WeatherAppTests
//
//  Created by Mohau Mpoti on 24/05/2021.
//

import XCTest
@testable import WeatherApp

class WeatherViewModelTests: XCTestCase {
    
    var weatherViewModel: WeatherViewModel!
    
    override func setUp() {
        weatherViewModel = WeatherViewModel(
            weatherType: nil,
            city: "Maseru",
            temperature: 21.3,
            minTemperature: 18,
            maxTemperature: 32.46
        )
    }
    
    override func tearDown() {
        weatherViewModel = nil
    }
    
    func test_city_is_not_nil() {
        XCTAssertNotNil(weatherViewModel.city)
    }
    
    func test_temperature_is_valid_value() {
        XCTAssertNotNil(weatherViewModel.temperature)
        XCTAssertNotNil(weatherViewModel.minTemperature)
        XCTAssertNotNil(weatherViewModel.maxTemperature)
    }
    
    func test_max_temp_is_greater_than_or_equal_to_min_temp() {
        XCTAssertGreaterThanOrEqual(weatherViewModel.maxTemperature, weatherViewModel.minTemperature)
    }
    
    func test_temp_is_greater_than_or_equal_to_min_temp() {
        XCTAssertGreaterThanOrEqual(weatherViewModel.temperature, weatherViewModel.minTemperature)
    }
    
    func test_min_temp_is_less_than_or_equal_to_max_temp() {
        XCTAssertLessThanOrEqual(weatherViewModel.temperature, weatherViewModel.maxTemperature)
    }
}
