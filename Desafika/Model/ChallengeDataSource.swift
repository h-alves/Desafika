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
    
//    var completeList: [Challenge] = [
////        Challenge(description: "Crie uma lista de pistas e esconda pequenos presentes ou notas em diferentes locais da casa ou do bairro. Deixe seu parceiro decifrar as pistas e encontrar os tesouros.", category: Category.house, progress: Progress.none),
////        Challenge(description: "Passem um dia sem tecnologia, desligando os celulares e dedicando tempo de qualidade um ao outro.", category: Category.house, progress: Progress.inProgress),
//        Challenge(description: "Teste", category: Category.house, progress: Progress.inProgress),
//        Challenge(description: "Teste", category: Category.movie, progress: Progress.inProgress),
//        Challenge(description: "Teste", category: Category.ambient, progress: Progress.inProgress),
//        Challenge(description: "Teste", category: Category.museum, progress: Progress.inProgress),
//        Challenge(description: "Teste", category: Category.park, progress: Progress.none),
//        Challenge(description: "Teste", category: Category.restaurant, progress: Progress.none),
//        
//        Challenge(description: "Teste 2", category: Category.house, progress: Progress.none),
//        Challenge(description: "Teste 2", category: Category.movie, progress: Progress.none),
//        Challenge(description: "Teste 2", category: Category.ambient, progress: Progress.none),
//        Challenge(description: "Teste 2", category: Category.museum, progress: Progress.none),
//        Challenge(description: "Teste 2", category: Category.park, progress: Progress.none),
//        Challenge(description: "Teste 2", category: Category.restaurant, progress: Progress.none)
//    ]
    
    private init(list: [Challenge] = [Challenge]()) {
        self.list = list
        retrieve()
    }
    
    func save() {
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(list) {
            defaults.set(encoded, forKey: "challengeDataSource")
            print("saved \(list.count)")
        }
    }
    
    func retrieve() {
        if let saved = defaults.object(forKey: "challengeDataSource") as? Data {
            print("saved")
            let decoder = JSONDecoder()
            
            do {
                let loaded = try decoder.decode([Challenge].self, from: saved)
                list = loaded
                print("retrieved \(loaded.count)")
            } catch {
                print(error)
            }
        }
    }
}
