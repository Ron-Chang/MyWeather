//
//  WeatherView.swift
//  MyWeather
//
//  Created by Ron Chang on 2022/1/15.
//

import SwiftUI

struct WeatherView: View {
    
    @ObservedObject var viewModel: WeatherViewModel
    
    var body: some View {
        ZStack {
            LinearGradient(
                    gradient: Gradient(colors: [Color(red: 0.89, green: 0.85, blue: 0.66), Color(red: 0.8, green: 0.55, blue: 0.76)]),
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                Text(viewModel.cityName)
                    .font(.largeTitle)
                    .padding()
                
                Text(viewModel.temperature)
                    .font(.system(size: 70))
                    .bold()
                
                Image(systemName: viewModel.weatherIcon)
                    .renderingMode(.original)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 100, height: 100, alignment: .center)
                
                Text(viewModel.weatherDescription)
                    .font(.largeTitle)
                    .padding()
            }.onAppear(perform: viewModel.refresh)
        }
    }
}

struct WeatherView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherView(viewModel: WeatherViewModel(weatherService: WeatherService()))
    }
}
