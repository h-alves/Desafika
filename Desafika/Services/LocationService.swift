//
//  LocationService.swift
//  Desafika
//
//  Created by Rafa (Ruffles) on 04/12/23.
//

import Foundation
import SwiftUI
import GooglePlaces

class LocationService : ObservableObject {
    static let shared = LocationService()

    private var locationManager : CLLocationManager?
    
    func getLocationManager() -> CLLocationManager {
        guard let manager = locationManager else {
            let newManager = ApiCalls.requestLocationAccess()
            setLocationManager(manager: newManager)
            return newManager
        }
        return manager
    }
    func isLocationAuthorized() -> Bool {
        guard let manager = locationManager else {
            return false
        }
        return manager.authorizationStatus == .authorizedAlways || manager.authorizationStatus == .authorizedWhenInUse
    }
    func setLocationManager(manager : CLLocationManager) { locationManager = manager }
}
