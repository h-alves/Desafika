//
//  SavedViewModel.swift
//  Desafika
//
//  Created by Henrique Semmer on 13/10/23.
//

import Foundation
import Combine

class SavedViewModel: ObservableObject {
    @Published var filteredList: [Challenge] = []
    
    var bag = Set<AnyCancellable>()
    
    func subscribe() {
        ChallengeDataSource.shared.$list.sink { challenges in
            self.updateList()
        }.store(in: &bag)
    }
    
    func cancelSubscription() {
        for item in bag {
            item.cancel()
        }
        bag.removeAll()
    }
    
    func updateList() {
        filteredList = ChallengeDataSource.shared.list.filter { c in
            return c.progress == .inProgress || c.progress == .finished
        }
    }
    
    func inProgress() -> [Challenge] {
        let list = filteredList.filter { c in
            return c.progress == .inProgress
        }
        
        return list
    }
    
    func finished() -> [Challenge] {
        let list = filteredList.filter { c in
            return c.progress == .finished
        }
        
        return list
    }
    
    func finishChallenge(challenge: Challenge) {
        let index = ChallengeDataSource.shared.list.firstIndex { c in
            return c.description == challenge.description
        }
        
        ChallengeDataSource.shared.list[index!].progress = .finished
        updateList()
    }
    
    func unfinishChallenge(challenge: Challenge) {
        let index = ChallengeDataSource.shared.list.firstIndex { c in
            return c.description == challenge.description
        }
        
        ChallengeDataSource.shared.list[index!].progress = .inProgress
        updateList()
    }
}
