//
//  PlaceUtils.swift
//  Mini Challenge 1
//
//  Created by Rafa (Ruffles) on 28/06/23.
//

import Foundation
import GooglePlaces

class PlaceUtils {
    static func searchDesafioPlaces(desafio: Challenge, locationManager: CLLocationManager, placesCount: Int, callbackEach: @escaping (Place) -> Void, callbackGeneral: @escaping (Bool) -> Void) {
        let location = cLLocationToGLocation(locationManager: locationManager)
        
        if (desafio.category.title != "Casa") {
            let searchByType : Bool = desafio.specificSearch == ""
            let searchTerm : String = desafio.specificSearch != "" ? desafio.specificSearch : desafio.category.mapsPlaceType
            ApiCalls.getNearbyPlaces(search: searchTerm, radius:  5000, location: location, searchByType: searchByType) { data in
                var placeIds : [String] = []
                let placeLimit = min(data.count, placesCount*2)
                if (placeLimit > 0) {
                    for i in 0...(placeLimit-1) {
                        placeIds.append(data[i].placeId)
                    }
                }
                placeIds.shuffle()
                
                let quantity = min(placesCount, placeIds.count)
                var count = 0
                ApiCalls.getMultiplePlaceDetails(placeIds: placeIds, quantity: quantity) { placeInfo in
                    let place = convertPlaceInfoToPlace(placeInfo: placeInfo, locationManager: locationManager)
                    callbackEach(place)
                    count += 1
                    if (count == quantity) {
                        callbackGeneral(true)
                    }
                }
            }
        }
        else {
            callbackGeneral(false)
        }
    }
    
    static func convertPlaceInfoToPlace(placeInfo : GApiResponse.PlaceInfo, locationManager : CLLocationManager) -> Place {
        // Old
//        let url = "https://www.google.com/maps/place/?q=place_id:"+placeInfo.placeId
        let urlString = "https://www.google.com/maps/search/?api=1&query="+(placeInfo.description ?? "")+"&query_place_id="+placeInfo.placeId
        let encondedUrl = ApiCalls.encodeUrl(urlString: urlString)
        
        let place = Place(
            name: placeInfo.name ?? "",
            category: convertPlaceType(googleMapsType: placeInfo.types![0]),
            price: placeInfo.priceLevel ?? 0, review: Float(placeInfo.rating ?? 0),
            distance: 0,
            url: encondedUrl,
            placeInfo: placeInfo
        )
        return place
    }
    
    static func cLLocationToGLocation(locationManager : CLLocationManager) -> GLocation {
        var currentLocation: CLLocation!
        if !(locationManager.authorizationStatus == .authorizedWhenInUse ||
             locationManager.authorizationStatus ==  .authorizedAlways) {
            print("Localizacao do usuario nao fornecida")
            return GLocation(latitude: 0,longitude: 0)
        }
        currentLocation = locationManager.location
        
        var gLocation = GLocation()
        gLocation.latitude = currentLocation.coordinate.latitude
        gLocation.longitude = currentLocation.coordinate.longitude
        return gLocation
    }
    
    static func convertPlaceType(googleMapsType : String) -> String {
        let categories = CategoryDataSource.shared.list
        for category in categories {
            if (category.mapsPlaceType == googleMapsType) {
                return category.title
            }
        }
        return ""
    }
    
    static func loadMultipleDistances(places: [Place], locationManager: CLLocationManager, id : Int = 0, done: @escaping () -> Void) {
        if (id < places.count) {
            places[id].loadDistance(locationManager: locationManager) {
                loadMultipleDistances(places: places, locationManager: locationManager, id: id+1, done: done)
            }
        }
        else {
            done()
        }
    }
}
