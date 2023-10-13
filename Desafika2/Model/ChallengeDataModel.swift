//
//  ChallengeDataModel.swift
//  Desafika2
//
//  Created by Henrique Semmer on 12/10/23.
//

import Foundation

class ChallengeDataModel {
    static let shared = ChallengeDataModel()
    
    var list: [Challenge] = [
        Challenge(description: "Crie uma lista de pistas e esconda pequenos presentes ou notas em diferentes locais da casa ou do bairro. Deixe seu parceiro decifrar as pistas e encontrar os tesouros.", category: Category.house, progress: Progress.none),
        Challenge(description: "Passem um dia sem tecnologia, desligando os celulares e dedicando tempo de qualidade um ao outro.", category: Category.house, progress: Progress.inProgress)
    ]
}
