//
//  Challenge.swift
//  Desafika
//
//  Created by Henrique Semmer on 12/10/23.
//

import Foundation

struct Challenge: Equatable {
    static func == (lhs: Challenge, rhs: Challenge) -> Bool {
        return lhs.description == rhs.description && lhs.category == rhs.category && lhs.progress == rhs.progress
    }
    
    let description: String
    let category: Category
    var progress: Progress
}

extension Challenge: Codable {
    enum ChallengeCodingKeys: String, CodingKey {
        case description, category, progress
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: ChallengeCodingKeys.self)
        description = try container.decode(String.self, forKey: .description)
        category = try container.decode(Category.self, forKey: .category)
        progress = try container.decode(Progress.self, forKey: .progress)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: ChallengeCodingKeys.self)
        try container.encode(description, forKey: .description)
        try container.encode(category, forKey: .category)
        try container.encode(progress, forKey: .progress)
    }
}
