//
//  OnboardingViewModel.swift
//  Desafika
//
//  Created by Henrique Semmer on 28/11/23.
//

import Foundation

class OnboardingViewModel: ObservableObject {
    
    func createList() {
        let completeList: [Challenge] = [
    //        Challenge(description: "Crie uma lista de pistas e esconda pequenos presentes ou notas em diferentes locais da casa ou do bairro. Deixe seu parceiro decifrar as pistas e encontrar os tesouros.", category: Category.house, progress: Progress.none),
    //        Challenge(description: "Passem um dia sem tecnologia, desligando os celulares e dedicando tempo de qualidade um ao outro.", category: Category.house, progress: Progress.inProgress),
            Challenge(description: "Teste", category: Category.house, progress: Progress.inProgress),
            Challenge(description: "Teste", category: Category.movie, progress: Progress.inProgress),
            Challenge(description: "Teste", category: Category.ambient, progress: Progress.inProgress),
            Challenge(description: "Teste", category: Category.museum, progress: Progress.inProgress),
            Challenge(description: "Teste", category: Category.park, progress: Progress.none),
            Challenge(description: "Teste", category: Category.restaurant, progress: Progress.none),
            
            Challenge(description: "Teste 2", category: Category.house, progress: Progress.none),
            Challenge(description: "Teste 2", category: Category.movie, progress: Progress.none),
            Challenge(description: "Teste 2", category: Category.ambient, progress: Progress.none),
            Challenge(description: "Teste 2", category: Category.museum, progress: Progress.none),
            Challenge(description: "Teste 2", category: Category.park, progress: Progress.none),
            Challenge(description: "Teste 2", category: Category.restaurant, progress: Progress.none)
        ]
        
        ChallengeDataSource.shared.list = completeList
    }
}
