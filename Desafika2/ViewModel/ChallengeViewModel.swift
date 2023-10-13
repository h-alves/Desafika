//
//  ChallengeViewModel.swift
//  Desafika2
//
//  Created by Henrique Semmer on 12/10/23.
//

import Foundation

class ChallengeViewModel: ObservableObject {
    @Published var challenge: Challenge = ChallengeDataModel.shared.list[0]
    
    func getRandomChallenge() {
        let challengeProgress = ChallengeDataModel.shared.list.filter { c in
            return c.progress == .none
        }
        
        challenge = challengeProgress.randomElement()!
    }
    
    func acceptChallenge() {
        let index = ChallengeDataModel.shared.list.firstIndex { c in
            c.self == challenge.self
        }
        
        ChallengeDataModel.shared.list[index!].progress = .inProgress
    }
}
