//
//  ChallengeDataSource.swift
//  Desafika
//
//  Created by Henrique Semmer on 12/10/23.
//

import Foundation

class ChallengeDataSource: ObservableObject {
    
    static let shared = ChallengeDataSource()
    
    let defaults = UserDefaults.standard
    
    @Published var list: [Challenge] = [Challenge]() {
        didSet {
            if oldValue != list {
                save()
                print("Valores diferentes")
            }
        }
    }
    
    private init(list: [Challenge] = [Challenge]()) {
        self.list = list
        retrieve()
    }
    
    func save() {
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(list) {
            defaults.set(encoded, forKey: "challengeDataSource")
        }
    }
    
    func retrieve() {
        if let saved = defaults.object(forKey: "challengeDataSource") as? Data {
            let decoder = JSONDecoder()
            
            do {
                let loaded = try decoder.decode([Challenge].self, from: saved)
                list = loaded
            } catch {
                print(error)
            }
        }
    }
}
