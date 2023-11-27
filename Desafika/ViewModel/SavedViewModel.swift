//
//  SavedViewModel.swift
//  Desafika
//
//  Created by Henrique Semmer on 13/10/23.
//

import Foundation

class SavedViewModel: ObservableObject {
    @Published var filteredList: [Challenge] = []
    
    func updateList() {
        filteredList = ChallengeDataModel.shared.list.filter { c in
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
        let index = ChallengeDataModel.shared.list.firstIndex { c in
            return c.description == challenge.description
        }
        
        ChallengeDataModel.shared.list[index!].progress = .finished
        updateList()
    }
    
    func unfinishChallenge(challenge: Challenge) {
        let index = ChallengeDataModel.shared.list.firstIndex { c in
            return c.description == challenge.description
        }
        
        ChallengeDataModel.shared.list[index!].progress = .inProgress
        updateList()
    }
}
