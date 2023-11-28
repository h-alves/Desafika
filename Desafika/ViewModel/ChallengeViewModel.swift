//
//  ChallengeViewModel.swift
//  Desafika
//
//  Created by Henrique Semmer on 12/10/23.
//

import SwiftUI

class ChallengeViewModel: ObservableObject {
    @Published var challenge: Challenge = ChallengeDataSource.shared.list[0]
    @Published var categoryFilter: [Category] = CategoryDataSource.shared.list.filter { c in
        return c.isSelected == true
    }
    @Published var noChallenge: Bool = false
    @Published var places: [Place] = []
    
    func getRandomChallenge() {
        let challengeFilter = ChallengeDataSource.shared.list.filter { c in
            return categoryFilter.contains(where: { category in
                category.self == c.category
            }) && c.progress == .none
        }
        
        if challengeFilter == [] {
            noChallenge = true
        } else {
            var newChallenge = challengeFilter.randomElement()!
            while newChallenge == challenge {
                newChallenge = challengeFilter.randomElement()!
            }
            challenge = newChallenge
        }
    }
    
    func acceptChallenge() {
        let index = ChallengeDataSource.shared.list.firstIndex { c in
            c.self == challenge.self
        }
        
        ChallengeDataSource.shared.list[index!].progress = .inProgress
    }
    
    func loadPlaces() {
        places.append(Place(name: "teste 1", category: "Restaurante", price: 1, review: 2.5, distance: 3.7))
        places.append(Place(name: "teste 2", category: "Restaurante", price: 1, review: 2.5, distance: 3.7))
        places.append(Place(name: "teste 3", category: "Restaurante", price: 1, review: 2.5, distance: 3.7))
        places.append(Place(name: "teste 4", category: "Restaurante", price: 1, review: 2.5, distance: 3.7))
        places.append(Place(name: "teste 5", category: "Restaurante", price: 1, review: 2.5, distance: 3.7))
    }
}
