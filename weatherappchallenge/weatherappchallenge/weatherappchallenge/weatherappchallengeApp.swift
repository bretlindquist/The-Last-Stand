//
//  weatherappchallengeApp.swift
//  weatherappchallenge
//
//  Created by Bret Allan Lindquist on 2/24/24.
//

import SwiftUI

@main
struct weatherappchallengeApp: App {
    var body: some Scene {
        WindowGroup {
          ContentView(forecast: tenDayForecast)
        }
    }
}
