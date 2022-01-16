//
//  WeatherService.swift
//  MyWeather
//
//  Created by Ron Chang on 2022/1/15.
//

import CoreLocation
import Foundation
import SwiftUI

public final class WeatherService: NSObject {
    
    private let locationManager = CLLocationManager()
    
    
    let API_KEY = Bundle.main.infoDictionary?["API_KEY"] ?? ""
    private var completionHandler: ((WeatherModel) -> Void)?
    
    public override init() {
        super.init()
        locationManager.delegate = self
    }
    
    public func loadWeatherData(_ completionHandler: @escaping((WeatherModel) -> Void)) {
        self.completionHandler = completionHandler
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
    }
    
    private func makeDataRequest(forCoordinates coordinates: CLLocationCoordinate2D) {
        guard let urlString = "https://api.openweathermap.org/data/2.5/weather?lat=\(String(coordinates.latitude))&lon=\(String(coordinates.longitude))&appid=\(API_KEY)&units=metric&lang=zh_tw".addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) else { return }

        guard let url = URL(string: urlString) else { return }
        print("url: \(url)")  // Debug
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard error == nil, let data = data else { return }
            if let response = try? JSONDecoder().decode(APIResponse.self, from: data) {
                print("response: \(response)")  // Debug
                self.completionHandler?(WeatherModel(response: response))
            }
        }.resume()
    }
}

extension WeatherService: CLLocationManagerDelegate {
    public func locationManager(
        _ manager: CLLocationManager,
        didUpdateLocations locations: [CLLocation]
    ) {
        guard let location = locations.first else { return }
        makeDataRequest(forCoordinates: location.coordinate)
    }
    
    public func locationManager(
        _ manager: CLLocationManager,
        didFailWithError error: Error
    ) {
        print("Something went wrong: \(error.localizedDescription)")
    }
}

struct APIResponse: Decodable {
    let name: String
    let main: APIMain
    let weather: [APIWeather]
}

struct APIMain: Decodable {
    let temp: Double
}

struct APIWeather: Decodable {
    let description: String
    let iconName: String

    enum CodingKeys: String, CodingKey {
        case description
        case iconName = "main"
    }
}
