//
//  WeatherViewModel.swift
//  MyWeather
//
//  Created by Ron Chang on 2022/1/16.
//

import Foundation

private let defaultIcon = "questionmark.diamond"

private let iconMap = [
    "Drizzle": "cloud.drizzle.fill",
    "Thunderstorm": "cloud.bolt.rain.fill",
    "Rain": "cloud.rain.fill",
    "Snow": "snowflake",
    "Clear": "sun.max.fill",
    "Clouds": "cloud.fill",
    "Mist": "cloud.fog.fill",
]

public class WeatherViewModel: ObservableObject {
    @Published var cityName: String = "City Name"
    @Published var temperature: String = "--"
    @Published var weatherDescription: String = "--"
    @Published var weatherIcon: String = defaultIcon
    
    public let weatherService: WeatherService
    
    public init(weatherService: WeatherService) {
        self.weatherService = weatherService
    }
    
    public func refresh() {
        weatherService.loadWeatherData { weather in
            DispatchQueue.main.async {
                self.cityName = weather.city
                self.temperature = "\(weather.temperature)°C"
                self.weatherDescription = weather.description.capitalized
                self.weatherIcon = iconMap[weather.iconName] ?? defaultIcon
            }
            
        }
    }
}
