//
//  ChallengeViewModel.swift
//  Desafika2
//
//  Created by Henrique Semmer on 12/10/23.
//

import SwiftUI

class ChallengeViewModel: ObservableObject {
    @Published var challenge: Challenge = ChallengeDataModel.shared.list[0]
    @Published var categoryFilter: [Category] = CategoryDataModel.shared.list.filter { c in
        return c.isSelected == true
    }
    
    func getRandomChallenge() {
        let challengeFilter = ChallengeDataModel.shared.list.filter { c in
            return categoryFilter.contains(where: { category in
                category.self == c.category
            }) && c.progress == .none
        }
        
        var newChallenge = challengeFilter.randomElement()!
        print(newChallenge)
        while newChallenge == challenge {
            newChallenge = challengeFilter.randomElement()!
            print(newChallenge)
        }
        challenge = newChallenge
    }
    
    func acceptChallenge() {
        let index = ChallengeDataModel.shared.list.firstIndex { c in
            c.self == challenge.self
        }
        
        ChallengeDataModel.shared.list[index!].progress = .inProgress
    }
}
