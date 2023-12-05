//
//  ChallengeViewModel.swift
//  Desafika
//
//  Created by Henrique Semmer on 12/10/23.
//

import SwiftUI

class ChallengeViewModel: ObservableObject {
    var locationService = LocationService.shared
    @Published var challenge: Challenge = Challenge.test
    @Published var categoryFilter: [Category] = CategoryDataSource.shared.list.filter { c in
        return c.isSelected == true
    }
    @Published var noChallenge: Bool = false
    @Published var places: [Place] = []
    @Published var loadingPlaces : Bool = false
    
    func getRandomChallenge() {
        let challengeFilter = ChallengeDataSource.shared.list.filter { c in
            return categoryFilter.contains(where: { category in
                category.title == c.category.title
            }) && c.progress == .none
        }
        
        if challengeFilter == [] {
            noChallenge = true
        } else if challengeFilter.count > 1 {
            var newChallenge = challengeFilter.randomElement()!
            while newChallenge == challenge {
                newChallenge = challengeFilter.randomElement()!
            }
            challenge = newChallenge
            loadPlaces()
        }
    }
    
    func acceptChallenge() {
        let index = ChallengeDataSource.shared.list.firstIndex { c in
            c.self == challenge.self
        }
        
        ChallengeDataSource.shared.list[index!].progress = .inProgress
    }
    
    func loadPlaces() {
        loadingPlaces = true
        places = []
        PlaceUtils.searchChallengePlaces(challenge: challenge, locationManager: locationService.getLocationManager(), placesCount: 5) { place in
            self.places.append(place)
        } callbackGeneral: { [self] success in
            if (success) {
                PlaceUtils.loadMultipleDistances(places: places, locationManager: locationService.getLocationManager()) {
                    self.loadingPlaces = false
                }
            }
            else {
                loadingPlaces = false
            }
        }
    }
    
    func placesText() -> String {
        if loadingPlaces {
            return "Carregando sugestões de lugares para este desafio..."
        }
        else if !places.isEmpty {
            return "Sugerimos alguns lugares para realizar esse desafio:"
        }
        return "Não foi possível carregar sugestões de lugares para este desafio."
    }
}
