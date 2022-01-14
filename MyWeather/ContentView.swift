//
//  ContentView.swift
//  SwiftPlayground
//
//  Created by Ron Chang on 2022/1/14.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.blue.opacity(0.88), Color("lightBlue")]),
                           startPoint: .topLeading,
                           endPoint: .bottomTrailing)
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                Text("Dubai,\nUnited Arab Emirates")
                    .multilineTextAlignment(.center)
                    .font(.system(size: 32, weight: .medium, design: .default))
                    .foregroundColor(.white)
                    .padding()
                
                VStack(spacing: 10) {
                    Image(systemName: "cloud.sun.fill")
                        .renderingMode(.original)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 180, height: 180)
                    
                    Text("28°")
                        .font(.system(size: 70, weight: .medium))
                        .foregroundColor(.white)
                }
                .padding(.bottom, 40)
                
                HStack(spacing: 20) {
                    WeatherDayView(dayOfWeek: "TUE", imageName: "cloud.sun.fill", temperature: 27)
                    WeatherDayView(dayOfWeek: "WED", imageName: "sun.max.fill", temperature: 29)
                    WeatherDayView(dayOfWeek: "THU", imageName: "cloud.fill", temperature: 22)
                    WeatherDayView(dayOfWeek: "FRI", imageName: "cloud.drizzle.fill", temperature: 20)
                    WeatherDayView(dayOfWeek: "SAT", imageName: "cloud.bolt.rain.fill", temperature: 18)
                }
                
                Spacer()
                
                Button {
                    print("tapped")
                } label: {
                    Text("Chang Day Time")
                        .frame(width: 280, height: 50)
                        .background(Color.white)
                        .font(.system(size: 20, weight: .bold, design: .default))
                        .cornerRadius(12)
                }
                
                Spacer()

            }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct WeatherDayView: View {
    
    var dayOfWeek: String
    var imageName: String
    var temperature: Int
    
    var body: some View {
        VStack(spacing: 8) {
            Text(dayOfWeek)
                .font(.system(size: 16, weight: .medium))
                .foregroundColor(.white)
            
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height: 40)
            
            Text("\(temperature)°")
                .font(.system(size: 28, weight: .medium))
                .foregroundColor(.white)
        }
    }
}
