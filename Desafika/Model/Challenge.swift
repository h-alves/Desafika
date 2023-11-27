//
//  Challenge.swift
//  Desafika
//
//  Created by Henrique Semmer on 12/10/23.
//

import Foundation

struct Challenge: Equatable {
    static func == (lhs: Challenge, rhs: Challenge) -> Bool {
        return lhs.description == rhs.description
    }
    
    let description: String
    let category: Category
    var progress: Progress
}
