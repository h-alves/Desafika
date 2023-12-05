//
//  Place.swift
//  Desafika
//
//  Created by Henrique Semmer on 15/10/23.
//

import Foundation
import GooglePlaces

class Place {
    let name: String
    let category: String
    let price: Int
    let review: Float
    var distance: Float
    let url: String
    var placeInfo : GApiResponse.PlaceInfo? = nil
    
    init(name: String, category: String, price: Int, review: Float, distance: Float, url: String, placeInfo: GApiResponse.PlaceInfo? = nil) {
        self.name = name
        self.category = category
        self.price = price
        self.review = review
        self.distance = distance
        self.url = url
        self.placeInfo = placeInfo
    }
    
    func loadDistance(locationManager: CLLocationManager, done: @escaping () -> Void) {
        if (placeInfo != nil) {
//            print("Pegando distancia para o local:"+name)
            ApiCalls.getDistanceInKm(locationManager: locationManager, placeInfo: placeInfo!) { distance in
                self.distance = distance
                done()
            }
        }
    }
}
