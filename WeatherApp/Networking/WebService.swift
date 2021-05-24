//
//  WebService.swift
//  WeatherApp
//
//  Created by Mohau Mpoti on 24/05/2021.
//

import Foundation
import CoreLocation

class WebService {
    static let shared = WebService()
    
    private init() {}
    
    static func requestWeather(for location: CLLocation, completion: @escaping (Swift.Result<WeatherResponse, Error>) -> ()) {
        let longitude = location.coordinate.longitude
        let latitude = location.coordinate.latitude
        let urlStr =
            "https://api.openweathermap.org/data/2.5/weather?lat=\(latitude)&lon=\(longitude)&appid=2296c433bf2284841dd5a33ceead1f25"

        guard let url = URL(string: urlStr) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, err) in
            guard let data = data, err == nil else {
                if let err = err { completion(.failure(err)) }
                return
            }
            
            var json: WeatherResponse?
            do {
                json = try JSONDecoder().decode(WeatherResponse.self, from: data)
                guard let json = json else { return }
                completion(.success(json))
            } catch (let decodeError) {
                completion(.failure(decodeError))
            }
        }.resume()
    }
    
    static func requestForecast(for location: CLLocation, completion: @escaping (Swift.Result<WeatherForecastResponse, Error>) -> ()) {
        let longitude = location.coordinate.longitude
        let latitude = location.coordinate.latitude
        let urlStr =
            "https://api.openweathermap.org/data/2.5/forecast?lat=\(latitude)&lon=\(longitude)&appid=2296c433bf2284841dd5a33ceead1f25"

        guard let url = URL(string: urlStr) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, err) in
            guard let data = data, err == nil else {
                if let err = err { completion(.failure(err)) }
                return
            }
            
            var json: WeatherForecastResponse?
            do {
                json = try JSONDecoder().decode(WeatherForecastResponse.self, from: data)
                guard let json = json else { return }
                completion(.success(json))

            } catch DecodingError.keyNotFound(let key, let context) {
                Swift.print("could not find key \(key) in JSON: \(context.debugDescription)")
            } catch DecodingError.valueNotFound(let type, let context) {
                Swift.print("could not find type \(type) in JSON: \(context.debugDescription)")
            } catch DecodingError.typeMismatch(let type, let context) {
                Swift.print("type mismatch for type \(type) in JSON: \(context.debugDescription)")
            } catch DecodingError.dataCorrupted(let context) {
                Swift.print("data found to be corrupted in JSON: \(context.debugDescription)")
            } catch let error as NSError {
                NSLog("Error in read(from:ofType:) domain= \(error.domain), description= \(error.localizedDescription)")
            }
        }.resume()
    }
}
