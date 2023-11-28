//
//  Progress.swift
//  Desafika
//
//  Created by Henrique Semmer on 12/10/23.
//

import Foundation

enum Progress: CaseIterable, Equatable {
    case none, inProgress, finished
}

extension Progress: Codable {
    
}
