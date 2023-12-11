//
//  ContentView.swift
//  weather-app
//
//  Created by hanna li on 11/27/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject var locationManager = LocationManager()//class from locationManager
    
    
    var body: some View {
        VStack {
            if let location = locationManager.location {
                Text("Your coordinates are: \(location.longitude),\(location.latitude)")
            } else {
                if locationManager.isLoading {
                    LoadingView()
                } else {
                    WelcomeView()
                        .environmentObject(locationManager)
                }
            }
        }
        .padding()
        .background(Color(hue: 0.622, saturation: 0.787, brightness: 0.342))
        .preferredColorScheme(.dark)
    }
}

#Preview {
    ContentView()
}
