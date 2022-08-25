//
//  ContentView.swift
//  weatherApp2
//
//  Created by Aleksandr on 10/08/22.
//

import SwiftUI
import CoreData

struct ContentView: View {

     @State private var isNight = false
    
    var body: some View {
        ZStack{
            
            BackgroundView(isNight: $isNight)
            
            VStack(spacing:30){
                CityTextView(cityName: "Tashkent")
                
                MainWeatherStatusView( imageName: isNight  ? "sun.max.fill" : "cloud.sun.fill", temperature: 36)
                
                HStack(spacing: 20){
                    WeatherDayView(dayOfWeek: "TUE", imageName: "cloud.sun.fill", temperature: 36)
                    
                    WeatherDayView(dayOfWeek: "WED", imageName: "sun.max.fill",
                        temperature: 30)
                    
                    WeatherDayView(dayOfWeek: "THU", imageName: "wind.snow",
                        temperature: -5)
                    
                    WeatherDayView(dayOfWeek: "FRI", imageName: "cloud.sun.rain.fill",
                        temperature: 10)
                    
                    WeatherDayView(dayOfWeek: "SAT", imageName: "cloud.snow.fill",
                        temperature: 5)
                }
                
                    Spacer()
                
                Button{
                    isNight.toggle()
                    
                }label: {
                    WeatherButton(title: "Change Day Time",
                                  textColor: .black,
                                  backgroundColor: .white)
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
    var dayOfWeek : String
    var imageName: String
    var temperature: Int
    
    var body: some View {
        
        VStack() {
            
            Text(dayOfWeek)
                .font(.system(size: 16, weight: .medium, design: .default))
                .foregroundColor(.white)
            
            Image(systemName: imageName )
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height: 40)
            
            Text("\(temperature)°")
                .font(.system(size:28,weight: .medium))
                .foregroundColor(.white)
            
        }
    }
}

struct BackgroundView: View {
    
    @Binding var isNight: Bool
    
    var body: some View {
        
        LinearGradient(gradient: Gradient(colors:  [isNight ? .black : .black, isNight ? .gray : Color("lightBlue") ]),
                       startPoint: .top,
                       endPoint: .bottom)
            .edgesIgnoringSafeArea(.all)
    }
}


struct CityTextView: View {
    var cityName: String
    var body: some View {
        Text(cityName)
            .font(.system(size: 32, weight: .medium, design: .default))
            .foregroundColor(.white)
    }
}

struct MainWeatherStatusView: View {
    
    var imageName: String
    var temperature: Int
    
    var body: some View {
        
        VStack(spacing: 10){
            Image(systemName:  imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 180, height: 180)
            
            Text("\(temperature)°")
                .font(.system(size: 70 , weight: .medium))
                .foregroundColor(.white)
        }
    }
}
  
