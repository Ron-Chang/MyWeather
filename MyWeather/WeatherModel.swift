//
//  WeatherModel.swift
//  MyWeather
//
//  Created by Ron Chang on 2022/1/15.
//

import Foundation

public struct WeatherModel {
    let city: String
    let temperature: String
    let description: String
    let iconName: String
    
    init(response: APIResponse) {
        city = response.name
        temperature = "\(Int(response.main.temp))"
        description = response.weather.first?.description ?? ""
        iconName = response.weather.first?.iconName ?? ""
    }
}
