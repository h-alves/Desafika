//
//  ApiCalls.swift
//  Mini Challenge 1
//
//  Created by Rafa (Ruffles) on 27/06/23.
//

import Foundation
import GooglePlaces

class ApiCalls {
//    static func convertPlaceInfoToPlace(placeInfo: GApiResponse.PlaceInfo) -> Place {
//
//    }
    
    static func requestLocationAccess() -> CLLocationManager {
        let locationManager = CLLocationManager()
        locationManager.requestAlwaysAuthorization()
        return locationManager
    }
    
    static func checkAuthorizationStatus(locationManager: CLLocationManager) -> String {
        if (locationManager.authorizationStatus == .authorizedAlways) {
            return "Always"
        }
        if (locationManager.authorizationStatus == .authorizedWhenInUse) {
            return "WhenInUse"
        }
        return "Unauthorized"
    }
    
    static func encodeUrl(urlString: String) -> String {
        let illegalCharacters : [String] = ["|"," ",",", ]
        let replacements : [String] = ["%7C", "+", "%2C"]

        var result = urlString
        for i in 0...(illegalCharacters.count-1) {
            result = result.replacingOccurrences(of: illegalCharacters[i], with: replacements[i])
        }
        
        // Remover acentos (diacritics)
        result = result.folding(options: .diacriticInsensitive, locale: .current)
        return result
    }
    
    static func getNearbyPlaces(search: String, radius: Int, location: GLocation, searchByType: Bool, callback: @escaping ([GApiResponse.NearBy]) -> Void) {
        var input = GInput()
        input.keyword = search
        input.radius = radius
        input.destinationCoordinate = location
        let searchType = searchByType ? GoogleApi.UsedFor.nearByType : GoogleApi.UsedFor.nearBy
        GoogleApi.shared.callApi(searchType, input: input) { (response) in
            if let data = response.data as? [GApiResponse.NearBy], response.isValidFor(.nearBy){
                callback(data)
            }
            else if let data = response.data as? [GApiResponse.NearBy] {
                callback(data)
            }
            else if let error = response.error {
                callback([])
                print("Erro na pesquisa de nearby: ")
                print(error)
            }
            else {
                callback([])
                print("Erro não identificado na pesquisa de nearby")
            }
        }
    }
    
    static func getMultiplePlaceDetails(placeIds : [String], quantity: Int, callbacks: @escaping (GApiResponse.PlaceInfo) -> Void) {
        if (quantity > 0) {
            getPlaceDetails(placeId: placeIds[quantity-1]) { placeInfo in
                callbacks(placeInfo)
                getMultiplePlaceDetails(placeIds: placeIds, quantity: quantity-1, callbacks: callbacks)
            }
        }
    }
    
    static func getDistanceInKm(locationManager: CLLocationManager, placeInfo: GApiResponse.PlaceInfo, callback: @escaping (Float) -> Void ) {
        var input = GInput()
        let origin = PlaceUtils.cLLocationToGLocation(locationManager: locationManager)
        let destination = GLocation.init(latitude: placeInfo.latitude, longitude: placeInfo.longitude)
        input.destinationCoordinate = destination
        input.originCoordinate = origin
        GoogleApi.shared.callApi(.path , input: input) { (response) in
            if let path = response.data as? GApiResponse.Path {
                //Enjoy the Path Api
                callback((Float)(path.distance?.value ?? 0) / 1000.0)
            } else { print(response.error ?? "DISTANCE CALCULATION ERROR") }
        }
    }
    
    static func getPlaceDetails(placeId : String, callback: @escaping (GApiResponse.PlaceInfo) -> Void) {
        var input = GInput()
        input.keyword = placeId
        GoogleApi.shared.callApi(.placeInformation,input: input) { (response) in
            if let place =  response.data as? GApiResponse.PlaceInfo, response.isValidFor(.placeInformation) {
                callback(place)
            } else { print(response.error ?? "PLACE DETAILS ERROR") }
        }
    }
    
    static func fetchApiData(urlString : String, completionHandler: @escaping (String) -> Void) {
      // Setup the variable dataString
        let dataString : String = ""
//        let task = URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) in
//          // your code here
//        })
        let url = URL(string: urlString)!
        let task = URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) in
            if let error = error {
                print("Error accessing api: "+error.localizedDescription)
              return
            }
            guard let httpResponse = response as? HTTPURLResponse,
                        (200...299).contains(httpResponse.statusCode) else {
                print("Error with the response, unexpected status code: \(String(describing: response))")
                return
            }
            
        })

        task.resume()
      
      // Call the API with some code
      
      // Using data from the API, assign a value to lotsOfFilms
      
      // Give the completion handler the variable, lotsOfFilms
      completionHandler(dataString)
    }
}
