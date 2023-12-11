//
//  locationManager.swift
//  weather-app
//
//  Created by hanna li on 11/27/23.
//

import Foundation
import CoreLocation
class LocationManager: NSObject, ObservableObject, CLLocationManagerDelegate {
    let manager = CLLocationManager()
    
    @Published var location: CLLocationCoordinate2D? //question mark (?) after the type of a value to mark the value as optional
    @Published var isLoading = false//has not requested
    
    override init() {
        super.init()
        manager.delegate = self
    }
    
    func requestLocation() {
        isLoading = true
        manager.requestLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {//type didupdatelocation
        location = locations.first?.coordinate
        isLoading = false
    }//without this CLLocationManagerDelegate does not work
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Error getting location", error)
        isLoading = false
    }
    
}
