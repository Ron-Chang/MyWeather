//
//  MyWeatherApp.swift
//  MyWeather
//
//  Created by Ron Chang on 2022/1/14.
//

import SwiftUI

@main
struct MyWeatherApp: App {
    var body: some Scene {
        WindowGroup {
            let weatherService = WeatherService()
            let viewModel = WeatherViewModel(weatherService: weatherService)
            WeatherView(viewModel: viewModel)
//            ContentView()
        }
    }
}
