//
//  ContentView.swift
//  weatherappchallenge
//
//  Created by Bret Allan Lindquist on 2/24/24.
//

import SwiftUI

struct ContentView: View {
  @State var forecast: [DailyWeather]

  var body: some View {
    GeometryReader { geometry in
      ZStack(alignment: .top) {
        Color("BackColor")
          .ignoresSafeArea()

        Rectangle()
          .foregroundColor(Color("BackColor"))
          .frame(width: 391, height: 150)
          .opacity(1)
          .edgesIgnoringSafeArea(.top)
          .zIndex(1)

        if geometry.size.height > geometry.size.width {
          // Portrait
          CityCurrentTempView()
          DailyAndCurrentWeatherView()
          TenDayForecastPortraitView(forecast: tenDayForecast)
        } else {
          // Landscape

          VStack {
            HStack {
              Spacer()
              CityCurrentTempView()
                .padding(.leading, 35)
              DailyAndCurrentWeatherView()
                .padding(.trailing, 40)
              Spacer()
            }
            Spacer()

            TenDayForecastLandscapeView(forecast: tenDayForecast)
          }
        }
      }
    }
    .edgesIgnoringSafeArea(.all)
  }
}


struct WeatherData {
  // city, currentTemp, highTemp, lowTemp, weatherCondition, weatherIcon, [weatherData8amto12pm]
  var city: String
  var currentTemp: String
  var highTemp: String
  var lowTemp: String
  var weatherCondition: String
  var weatherIcon: String

  var weatherData8amto12pm: [WeatherData]


}
struct CityCurrentTempView: View {
  var body: some View {
    ZStack {

      HStack {
        VStack(alignment: .leading) {
          Text("Cupertino")
            .font(.system(size: 32))
            .foregroundStyle(Color("TextColor"))
          Text("63°")
            .font(.system(size: 44))
            .fontWeight(.medium)
            .foregroundStyle(Color("TextColor"))
          Spacer()
        }
        .padding(.all, 40)
        Spacer()
      }
      .ignoresSafeArea()
    }
    .zIndex(2)

  }
}

struct DailyAndCurrentWeatherView: View {
  var body: some View {
    ZStack {

      HStack {
        Spacer()
        VStack(alignment: .trailing) {
          Image(systemName: "sun.max.fill")
            .resizable()
            .renderingMode(.original)
            .frame(width: 30, height: 30)
            .padding(.vertical, -10)
          Text("Sunny")
            .font(.system(size: 30))
            .foregroundStyle(Color("TextColor"))
            .opacity(0.8)
          Text("H:63° L:42°")
            .font(.system(size: 25))
            .fontWeight(.medium)
            .foregroundStyle(Color("TextColor"))
            .opacity(0.8)

          Spacer()
        }
        .padding(.all, 40)
      }
      .ignoresSafeArea()
    }
    .zIndex(2)

  }
}


struct HourlyWeatherView: View {
  var body: some View {
    HStack {
      VStack(alignment: .center, spacing: 10) {
        Text("8AM")
          .foregroundColor(Color("TextColor"))
          .font(.system(size: 25))
          .fontWeight(.medium)
          .padding(.all, 5)
        Image(systemName: "sun.max.fill")
          .renderingMode(.original)
          .resizable()
          .frame(width: 30, height: 30)
          .padding(.all, 5)
        Text("63°")
          .foregroundColor(Color("TextColor"))
          .font(.system(size: 25))
          .fontWeight(.medium)
          .padding(.all, 5)
      }
      .padding([.leading, .bottom], 60)

      Spacer()
    }
  }
}


struct TenDayForecastLandscapeView: View {
  var forecast: [DailyWeather]

  var body: some View {

    ScrollView(.horizontal, showsIndicators: false) {
      HStack {
        ForEach(forecast, id: \.time) { day in
          VStack {
            Text(day.time)
              .foregroundColor(Color("TextColor"))
              .font(.system(size: 25))
              .fontWeight(.medium)
              .padding(.all, 5)
            Image(systemName: day.iconName)
              .renderingMode(.original)
              .resizable()
              .frame(width: 30, height: 30)
              .padding(.all, 5)
            Text(day.temperature)
              .foregroundColor(Color("TextColor"))
              .font(.system(size: 25))
              .fontWeight(.medium)
              .padding(.all, 5)
          }
          .padding(.horizontal, 40)
        }
      }
    }
    .padding(.all, 30)
    .padding(.bottom, 30)
  }
}
struct TenDayForecastPortraitView: View {
  var forecast: [DailyWeather]

  var body: some View {

    ZStack (alignment: .top) {

    ScrollView(.vertical, showsIndicators: false) {

      VStack(spacing: 0) {
        Spacer()
        Text("")
          .frame(width: 100, height: 130)
        ForEach(forecast, id: \.time) { day in
          VStack {
            Spacer()
            HStack(alignment: .center, spacing: 20) {
              Spacer()

              Text(day.time)
                .foregroundColor(Color("TextColor"))
                .font(.system(size: 25))
                .fontWeight(.medium)
                .padding(.all, 5)
              Spacer()
              Image(systemName: day.iconName)
                .renderingMode(.original)
                .resizable()
                .frame(width: 30, height: 30)
                .padding(.all, 5)
              Spacer()

              Text(day.temperature)
                .foregroundColor(Color("TextColor"))
                .font(.system(size: 25))
                .fontWeight(.medium)
                .padding(.all, 5)
              Spacer()

            }
          }
        }
        .padding(.vertical, 20)
      }
      }
//    .padding(.all, 30)
//    .padding(.bottom, 30)

    }
  }
}


struct DailyWeather {
  let time: String
  let iconName: String
  let temperature: String

}


  let tenDayForecast: [DailyWeather] = [
    DailyWeather(time: "4AM", iconName: "sun.max.fill", temperature: "63°"),
    DailyWeather(time: "6AM", iconName: "sun.max.fill", temperature: "63°"),
    DailyWeather(time: "8AM", iconName: "cloud.sun.fill", temperature: "60°"),
    DailyWeather(time: "10PM", iconName: "cloud.fill", temperature: "58°"),
    DailyWeather(time: "12PM", iconName: "cloud.rain.fill", temperature: "55°"),
    DailyWeather(time: "2PM", iconName: "wind", temperature: "57°"),
    DailyWeather(time: "4PM", iconName: "snow", temperature: "53°"),
    DailyWeather(time: "6PM", iconName: "sunset.fill", temperature: "62°"),
    DailyWeather(time: "8PM", iconName: "sun.max.fill", temperature: "65°"),
    DailyWeather(time: "10PM", iconName: "cloud.sun.fill", temperature: "64°")
  ]



struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView(forecast: tenDayForecast)
      .previewInterfaceOrientation(.landscapeLeft)
    ContentView(forecast: tenDayForecast)
  }
}
