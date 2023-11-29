//
//  ChallengeViewModel.swift
//  Desafika
//
//  Created by Henrique Semmer on 12/10/23.
//

import SwiftUI

class ChallengeViewModel: ObservableObject {
    @Published var challenge: Challenge = Challenge.test
    @Published var categoryFilter: [Category] = CategoryDataSource.shared.list.filter { c in
        return c.isSelected == true
    }
    @Published var noChallenge: Bool = false
    @Published var places: [Place] = []
    
    func getRandomChallenge() {
        print("Pegando desafio aleatório")
        
        print("Category Filter: \(categoryFilter)")
        print("All challenges: \(ChallengeDataSource.shared.list)")
        
        let challengeFilter = ChallengeDataSource.shared.list.filter { c in
            return categoryFilter.contains(where: { category in
                category.title == c.category.title
            }) && c.progress == .none
        }
        
        print("Todos os desafios: \(challengeFilter)")
        
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
